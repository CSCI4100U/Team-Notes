import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'Notes.dart';
import '../Notification Handling/Notifications_file.dart';

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
        title: Text(FlutterI18n.translate(context, "node.view")),
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