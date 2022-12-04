import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'Pages/LoginPage.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  print(position);

  runApp(MyApp(position: position,));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.position});
  var position;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Notes',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.indigo
      ),
      home: MyHomePage(title: 'Register/Login', position: position),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, this.position});
  final String title;
  var position;

  @override
  State<MyHomePage> createState() => _MyHomePageState(position: position);
}

class _MyHomePageState extends State<MyHomePage> {
  var position;
  _MyHomePageState({this.position});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: loginPage(position: position),
    );
  }
}
