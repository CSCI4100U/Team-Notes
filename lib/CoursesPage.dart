import 'package:flutter/material.dart';
import 'NotesPage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notfication_api.dart';


class coursesPage extends StatefulWidget {


  @override
  void initState(){
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon.png');

  }

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
    String text = courses[0].toString();
    List<String> allCourses = text.split(',');
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Courses Page'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50.0),
                        height: 100,
                        color: Colors.orangeAccent.withOpacity(0.8),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  allCourses[0],
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 25),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: FloatingActionButton(
                                    onPressed: (){
                                      NotificationApi?.showNotification(
                                          title: 'Study Hard',
                                          body:
                                          'Make sure you take your notes!',
                                        payload: 'sarah.abs'
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Notes(sid: '100000001',)
                                        ),
                                      );},
                                    child: const Icon(Icons.add),
                                  )
                              )
                            ],
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50.0),
                        height: 100,
                        color: Colors.blueAccent.withOpacity(0.8),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                allCourses[1],
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                                child: FloatingActionButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Notes(sid: '100001')
                                      ),
                                    );},
                                  child: const Icon(Icons.add),
                                )
                            )
                          ],
                        )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50.0),
                        height: 100,
                        color: Colors.orangeAccent.withOpacity(0.8),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  allCourses[2],
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 25),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: FloatingActionButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Notes(sid: '100000001',)
                                        ),
                                      );},
                                    child: const Icon(Icons.add),
                                  )
                              )
                            ],
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50.0),
                        height: 100,
                        color: Colors.blueAccent.withOpacity(0.8),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  allCourses[3],
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 25),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: FloatingActionButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Notes(sid: '100000001',)
                                        ),
                                      );},
                                    child: const Icon(Icons.add),
                                  )
                              )
                            ],
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50.0),
                        height: 100,
                        color: Colors.orangeAccent.withOpacity(0.8),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  allCourses[4],
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 25),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: FloatingActionButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Notes(sid: '100000001',)
                                        ),
                                      );},
                                    child: const Icon(Icons.add),
                                  )
                              )
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}