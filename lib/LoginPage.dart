//Ginthushan Kandasamy
//11/10/2022
//This is the login ui where the user will login, if they do not have an account
// they can hit the register button and make one

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/CoursesPage.dart';
import 'RegisterPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final formKey = GlobalKey<FormState>();

  var _studentIDController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _validate_sid = false;
  bool _validate_pass = false;

  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('logins');
  List usernames = [];
  List passwords = [];
  List courses = [];


  static const snackBar = SnackBar(
    content: Text('Please make sure you have entered information correctly'),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            child: Image.network("https://shared.ontariotechu.ca/shared/uoit/images/ontariotechu-og-image.jpg"),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
              controller: _studentIDController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Banner/Student ID',
                errorText: _validate_sid ? 'Invalid' : null,
              ),
            ),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                labelText: 'Password',
                errorText: _validate_pass ? 'Invalid' : null,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60.0),
            child: ElevatedButton(
              onPressed: () async {
                verfiyLogin();
                if (_studentIDController.text.isEmpty){
                  setState(() {
                    _validate_sid = true;
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }

                if (_passwordController.text.isEmpty){
                  setState(() {
                    _validate_pass = true;
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }
                else{
                  setState(() {
                    _validate_sid = false;
                    _validate_pass = false;
                  });
                }

              },
              child: const Text("Login"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: ElevatedButton(
              onPressed: () {
                if (_studentIDController.text.isNotEmpty | _passwordController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterPage(sid: _studentIDController.text,
                        password: _passwordController.text,)),
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    _validate_sid = true;
                    _validate_pass = true;
                  });
                }
              },
              child: const Text("Register"),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> verfiyLogin() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    for (int i = 0; i < querySnapshot.docs.length; i++){
      usernames.add(querySnapshot.docs[i].get('sid'));
    }
    for (int i = 0; i < querySnapshot.docs.length; i++){
      passwords.add(querySnapshot.docs[i].get('password'));
    }

    if (usernames.contains(_studentIDController.text)){
      int index = usernames.indexOf(_studentIDController.text);
      if (passwords[index] == _passwordController.text){
        for (int i = 0; i < querySnapshot.docs.length; i++){
          courses.add(querySnapshot.docs[index].get('courses'));
        }
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => coursesPage(courses: courses, studentID: _studentIDController.text,),
        ));
      }
      else{
        _studentIDController.clear();
        _passwordController.clear();
        setState(() {
          _validate_sid = true;
          _validate_pass = true;
        });
      }
    }


  }
}
