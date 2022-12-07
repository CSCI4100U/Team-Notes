import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:geolocator/geolocator.dart';
import 'Pages/LoginPage.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Future main() async{

  Geolocator.isLocationServiceEnabled().then((value) => null);
  Geolocator.requestPermission().then((value) => null);
  Geolocator.checkPermission().then(
          (LocationPermission permission)
      {
      }
  );
  Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best
    ),
  ).listen((event) { });


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
      home: MyHomePage(position: position,),
      localizationsDelegates: [FlutterI18nDelegate(
        translationLoader: FileTranslationLoader(
          useCountryCode: false,
          fallbackFile: 'en',
          basePath: 'assets/i18n',
          ),
        ),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('fr', ''),
        Locale('es', ''),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key,this.position});
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
        actions: [
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () async{
                Locale newLocale = Locale('en');
                await FlutterI18n.refresh(context, newLocale);
                setState(() {

                });
              },
              child: Text("EN")
          ),
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () async{
                Locale newLocale = Locale('fr');
                await FlutterI18n.refresh(context, newLocale);
                setState(() {

                });
              },
              child: Text("FR")
          ),
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () async{
                Locale newLocale = Locale('es');
                await FlutterI18n.refresh(context, newLocale);
                setState(() {

                });
              },
              child: Text("ES")
          ),
        ],
        title: Text(FlutterI18n.translate(context, "login.title")),
      ),
      body: loginPage(position: position),
    );
  }
}
