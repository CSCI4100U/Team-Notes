import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  String? sid;
  String? password;
  RegisterPage({super.key, this.sid, this.password});

  var _course1 = TextEditingController();
  var _course2 = TextEditingController();
  var _course3 = TextEditingController();
  var _course4 = TextEditingController();
  var _course5 = TextEditingController();

  List courses = [];

  bool check = false;

  static const snackBar = SnackBar(
    content: Text('Account Created'),
  );

  static const snackBar_error = SnackBar(
    content: Text('Make sure all fields are filled'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: 200,
              child: Image.network("https://shared.ontariotechu.ca/shared/uoit/images/ontariotechu-og-image.jpg"),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                controller: _course1,
                decoration: InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 1',
                  errorText: check ? 'There is a missing field' : null
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                controller: _course2,
                decoration: InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 2',
                    errorText: check ? 'There is a missing field' : null
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                controller: _course3,
                decoration: InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 3',
                    errorText: check ? 'There is a missing field' : null
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                controller: _course4,
                decoration: InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 4',
                    errorText: check ? 'There is a missing field' : null
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                controller: _course5,
                decoration: InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 5',
                    errorText: check ? 'There is a missing field' : null
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_validate() == true) {
                    Navigator.pop(context);
                    register();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(snackBar_error);
                    check = true;
                  }
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future register() async {

    courses.add(_course1.text);
    courses.add(_course2.text);
    courses.add(_course3.text);
    courses.add(_course4.text);
    courses.add(_course5.text);

    print("Adding a new entry...");
    final data = <String, Object?>{
      "sid": sid,
      "password": password,
      "courses" : courses
    };
    await
    FirebaseFirestore.instance.collection('logins').doc().set(data);
  }

  bool _validate(){
    if (_course1.text.isNotEmpty |
    _course2.text.isNotEmpty |
    _course3.text.isNotEmpty |
    _course4.text.isNotEmpty |
    _course5.text.isNotEmpty){
      return true;
    }
    else{
      return false;
    }
  }
}