import 'package:flutter/material.dart';
import 'notes.dart';

class Notes extends StatefulWidget {
  const Notes({super.key, required this.sid});

  final String sid;

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  Note note2 = new Note(id: 2, sid: '1', course: 'CSCI102');
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoteDetails(note2)),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                color: Colors.green,
                child: Text(note2.toMap()['course']),
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
