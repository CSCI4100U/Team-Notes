import 'package:flutter/material.dart';
import 'package:notepad/notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Categories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Notes(sid: '100000001'),
    );
  }
}

class Notes extends StatefulWidget {
  const Notes({super.key, required this.sid});

  final String sid;

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  // Note note = new Note(id: 2, sid: '1', course: 'CSCI102');
  Note note = new Note(id: 1, sid: '1', course: 'CSCI101');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sid + ' Notes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Display Note Categories here with onclick to load note details page:',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoteDetails(note)),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                color: Colors.green,
                child: Text(note.toMap()['course']),
              ),
            ),
          ],
        ),
      ),
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
  var notedetails = [];
  _getNoteDetails() async {
    final _noteid = widget.note.toMap()['id'];
    NotesModel ntmodel = NotesModel();
    _notes = await ntmodel.getNoteDetails(_noteid);
    notedetails = _notes;
    print(_notes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSCI102 notes'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder(
            future: _getNoteDetails(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  padding: EdgeInsets.all(5),
                  itemCount: notedetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ListTile(
                        title: Text(notedetails[index].toMap()['title']),
                        subtitle: Text(notedetails[index].toMap()['note']),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
