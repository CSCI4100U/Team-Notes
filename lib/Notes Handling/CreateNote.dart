import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'Notes.dart';
import '../Notification Handling/Notifications_file.dart';

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
        title: Text(FlutterI18n.translate(context, "node.page_title")),
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
                      FlutterI18n.translate(context, "node.title"),
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
                        hintText: FlutterI18n.translate(context, "node.enter_title"),
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
                      hintText: FlutterI18n.translate(context, "node.enter_note"),
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