import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'Notes.dart';
import 'Notifications_file.dart';


class coursesPage extends StatefulWidget {
  List courses;
  String studentID;
  coursesPage({Key? key, required this.courses, required this.studentID}) : super(key: key);

  @override
  State<coursesPage> createState() => _coursesPageState(courses: courses, studentID: studentID);
}

class _coursesPageState extends State<coursesPage> {
  List courses;
  String studentID;
  _coursesPageState({required this.courses, required this.studentID});


  final _notifications = Notifications();
  String title = 'Study Hard';
  String body = 'Make sure you take Notes!';
  String payload = 'Test';

  @override
  Widget build(BuildContext context) {
    _notifications.init();
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
                                      _notifications.sendNotificationNow(title, body, payload);
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
        )
    );
  }
}

class NoteDetails extends StatefulWidget {
  final note;
  const NoteDetails(this.note, {super.key});

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  late var _notes;
  var noteid;
  var notedetails = [];
  var titles;
  _getNoteDetails() async {
    final _noteid = widget.note.toMap()['id'];
    NotesModel ntmodel = NotesModel();
    _notes = await ntmodel.getNoteDetails(_noteid);
    notedetails = _notes;
    noteid = _noteid;
    // extracting titles to check for duplicate title in the add note page
    titles = notedetails.map((el) => el.toMap()['title']).toList();
  }

  void _deleteNote(NoteDetail notedetail) async {
    print('Deleting note');
    NotesModel ntmodel = NotesModel();
    ntmodel.deleteNoteDetail(notedetail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note.toMap()['course'] + ' notes'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder(
            future: _getNoteDetails(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount: notedetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditNote(notedetails[index].toMap())),
                              ).then((value) => setState(() {}));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index % 2 == 0
                                    ? Colors.blue[200]
                                    : Colors.orange[200],
                              ),
                              padding: EdgeInsets.all(5),
                              margin:
                              EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              // width: 300,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        notedetails[index].toMap()['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      notedetails[index].toMap()['note'],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _deleteNote(notedetails[index]);
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.delete,
                                size: 25,
                                color: Colors.red[500],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateNote(noteid, titles)),
          ).then((value) => setState(() {}));
        },
      ),
    );
  }
}

class CreateNote extends StatefulWidget {
  final noteid;
  final titles;
  const CreateNote(this.noteid, this.titles, {super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  var _newnote;
  var _newtitle;

  _createNote() async {
    NotesModel ntmodel = NotesModel();
    if (widget.titles.contains(_newtitle)) {
      print('Duplicate');
    } else {
      var notedetail =
      NoteDetail(id: widget.noteid, title: _newtitle, note: _newnote);
      await ntmodel.insertNoteDetail(notedetail);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Title: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter a Title',
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1.0, color: Colors.amber))),
                    onChanged: (value) {
                      _newtitle = value;
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter your notes here',
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1.0, color: Colors.amber))),
                  maxLines: null,
                  minLines: 25,
                  onChanged: (value) {
                    _newnote = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            _createNote();
          }),
    );
  }
}

class EditNote extends StatefulWidget {
  final notedetail;
  const EditNote(this.notedetail, {super.key});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  var _newnote;

  _updateNote() async {
    NotesModel ntmodel = NotesModel();
    var notedetail = NoteDetail(
        id: widget.notedetail['id'],
        title: widget.notedetail['title'],
        note: _newnote);
    if (_newnote != null) {
      await ntmodel.updateNoteDetail(notedetail);
      Navigator.pop(context);
    } else {
      print('required fields empty!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View/Edit Note'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.notedetail['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                child: TextField(
                  controller: TextEditingController()
                    ..text = widget.notedetail['note'],
                  decoration: InputDecoration(
                      hintText: 'Enter your notes here',
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1.0, color: Colors.amber))),
                  maxLines: null,
                  minLines: 25,
                  onChanged: (value) {
                    _newnote = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            _updateNote();
          }),
    );
  }
}