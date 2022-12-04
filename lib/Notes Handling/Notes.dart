import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  final int? id;
  final String sid;
  final String course;

  const Note({this.id, required this.sid, required this.course});

  Map<String, dynamic> toMap() {
    return {'id': id, 'sid': sid, 'course': course};
  }

  Note fromMap() {
    return Note(id: id, sid: sid, course: course);
  }
}

class NoteDetail {
  final int id;
  final String title;
  final String note;

  const NoteDetail({required this.id, required this.title, required this.note});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'note': note};
  }

  NoteDetail fromMap() {
    return NoteDetail(id: id, title: title, note: note);
  }
}

class NotesModel {
  Future<Database> dbConnection() async {
    print('Inside dbConnection:');
    return await openDatabase(
      join(await getDatabasesPath(), 'notes.db'),
      onCreate: (db, version) async {
        print('Inside onCreate:');
        await db.execute(
          'CREATE TABLE notes(id integer primary key, sid TEXT, course TEXT)',
        );
        await db.execute(
          'CREATE TABLE notedetails(id integer, title TEXT, note TEXT)',
        );
      },
      version: 2,
    );
  }

  Future<List<Note>> getAllNotes() async {
    final db = await dbConnection();
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        sid: maps[i]['sid'],
        course: maps[i]['course'],
      );
    });
  }

  Future<void> insertNote(Note note) async {
    print('In insert ${note}');
    final db = await dbConnection();
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteNote(Note note) async {
    final db = await dbConnection();
    await db.delete(
      'notedetails',
      where: 'id = ?',
      whereArgs: [note.id],
    );
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<List<NoteDetail>> getNoteDetails(int noteid) async {
    final db = await dbConnection();
    final List<Map<String, dynamic>> maps =
        await db.query('notedetails', where: 'id = ?', whereArgs: [noteid]);
    return List.generate(maps.length, (i) {
      return NoteDetail(
        id: maps[i]['id'],
        title: maps[i]['title'],
        note: maps[i]['note'],
      );
    });
  }

  Future<void> insertNoteDetail(NoteDetail notedetail) async {
    print('In insert ${notedetail}');
    final db = await dbConnection();
    await db.insert(
      'notedetails',
      notedetail.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateNoteDetail(NoteDetail notedetail) async {
    final db = await dbConnection();
    await db.update(
      'notedetails',
      notedetail.toMap(),
      where: 'id = ? and title = ?',
      whereArgs: [notedetail.id, notedetail.title],
    );
  }

  Future<void> deleteNoteDetail(NoteDetail notedetail) async {
    final db = await dbConnection();
    await db.delete(
      'notedetails',
      where: 'id = ? and title = ?',
      whereArgs: [notedetail.id, notedetail.title],
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotesModel ntmodel = NotesModel();
  // var gradex = Grade(id: 1, sid: '100000001', grade: 'A-');
  //var notex = Note(sid: '1', course: 'CSCI102');
  //await ntmodel.insertNote(notex);
  //var notedetail = NoteDetail(id: 2, title: 'lesson 2', note: 'lesson 2 notes');
  //await ntmodel.insertNoteDetail(notedetail);
  // gradex = Grade(id: gradex.id, sid: gradex.sid, grade: 'Y+');
  // await ntmodel.updateGrade(gradex);
  // await ntmodel.deleteGrade(gradex.id);
  var allNotes = await ntmodel.getAllNotes();
  var allNoteDetails = await ntmodel.getNoteDetails(2);
  allNotes.forEach((element) => {print(element.toMap())});
  allNoteDetails.forEach((element) => {print(element.toMap())});
  // print(allNotes.map((e) => {'sid': e.sid, 'course': e.course}));
  print('Completed execution!!!!!!!!!!!!!!!!!!!!');
}
