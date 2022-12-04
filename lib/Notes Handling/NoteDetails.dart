import 'package:flutter/material.dart';
import 'Notes.dart';
import 'CreateNote.dart';
import 'EditNote.dart';

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