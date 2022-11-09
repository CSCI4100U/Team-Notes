import 'package:flutter/material.dart';

class coursesPage extends StatefulWidget {
  List courses;
  coursesPage({Key? key, required this.courses}) : super(key: key);

  @override
  State<coursesPage> createState() => _coursesPageState(courses: courses);
}

class _coursesPageState extends State<coursesPage> {
  List courses;
  _coursesPageState({required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Register Page'),
        ),
      body: Center(
        child: Text(courses[0].toString()),
      )
    );
  }
}
