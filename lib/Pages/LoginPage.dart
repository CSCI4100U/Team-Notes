//Ginthushan Kandasamy
//11/10/2022
//This is the login ui where the user will login, if they do not have an account
// they can hit the register button and make one

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Pages/HomePage.dart';
import 'RegisterPage.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key, this.position}) : super(key: key);
  var position;

  @override
  State<loginPage> createState() => _loginPageState(position: position);
}

class _loginPageState extends State<loginPage> {
  _loginPageState({this.position});
  final formKey = GlobalKey<FormState>();

  var _studentIDController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _validate_sid = false;
  bool _validate_pass = false;
  var position;

  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('logins');
  List usernames = [];
  List passwords = [];
  List courses = [];



  @override
  Widget build(BuildContext context) {

    SnackBar snackBar = SnackBar(
      content: Text(FlutterI18n.translate(context, "login.error")),
    );

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
                labelText: FlutterI18n.translate(context, "login.student_id"),
                errorText: _validate_sid ? FlutterI18n.translate(context, "login.invalid") : null,
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
                labelText: FlutterI18n.translate(context, "login.password"),
                errorText: _validate_pass ? FlutterI18n.translate(context, "login.invalid") : null,
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
              child: Text(FlutterI18n.translate(context, "login.login")),
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
              child: Text(FlutterI18n.translate(context, "login.register")),
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
        print(position);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CoursesPage(courses: courses, studentID: _studentIDController.text,position: position,),
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
