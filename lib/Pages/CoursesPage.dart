import 'package:flutter/material.dart';
import 'package:untitled1/Pages/MapPage.dart';
import '../Notes Handling/NoteDetails.dart';
import '../Notes Handling/Notes.dart';
import '../Notification Handling/Notifications_file.dart';


class CoursesPage extends StatefulWidget {
  List courses;
  String studentID;
  var position;
  CoursesPage({Key? key, required this.courses, required this.studentID, this.position}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState(courses: courses, studentID: studentID, position: position);
}

class _CoursesPageState extends State<CoursesPage> {
  var position;
  List courses;
  String studentID;
  _CoursesPageState({required this.courses, required this.studentID, this.position});


  final _notifications = Notifications();
  String notification_title = 'Study Hard';
  String body = 'Make sure you take Notes!';
  String payload = 'Test';

  @override
  Widget build(BuildContext context) {
    _notifications.init();
    String text = courses[0].toString();
    List<String> allCourses = text.split(',');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Courses Page'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.note)),
                Tab(icon: Icon(Icons.map)),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              height: 100,
                              color: Colors.orangeAccent.withOpacity(0.8),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 15.0),
                                        child:
                                          Text(
                                            courses[0][0],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                          ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                        padding: const EdgeInsets.only(right: 15.0),
                                        child: FloatingActionButton(
                                          heroTag: "btn1",
                                          onPressed: (){
                                            _notifications.sendNotificationNow(notification_title, body, payload);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => NoteDetails(Note(id: int.parse(studentID)+1,sid: studentID, course: courses[0][0],))
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
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 15.0),
                                      child:
                                      Text(
                                        courses[0][1],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                      child: FloatingActionButton(
                                        heroTag: "btn2",
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => NoteDetails(Note(id: int.parse(studentID)+2,sid: studentID, course: courses[0][1],))
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
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 15.0),
                                        child:
                                        Text(
                                          courses[0][2],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                        padding: const EdgeInsets.only(right: 15.0),
                                        child: FloatingActionButton(
                                          heroTag: "btn3",
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => NoteDetails(Note(id: int.parse(studentID)+3,sid: studentID, course: courses[0][2],))
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
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 15.0),
                                        child:
                                        Text(
                                          courses[0][3],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                        padding: const EdgeInsets.only(right: 15.0),
                                        child: FloatingActionButton(
                                          heroTag: "btn4",
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => NoteDetails(Note(id: int.parse(studentID)+4,sid: studentID, course: courses[0][3],))
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
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 15.0),
                                        child:
                                        Text(
                                          courses[0][4],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                        padding: const EdgeInsets.only(right: 15.0),
                                        child: FloatingActionButton(
                                          heroTag: "btn5",
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => NoteDetails(Note(id: int.parse(studentID)+5,sid: studentID, course: courses[0][4],))
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
              ),
              MapPage(title: 'Map', position: position,)
            ],
          ),
      ),
    );
  }
}

