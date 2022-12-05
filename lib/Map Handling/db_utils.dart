import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils{
  static Future init() async{
    //set up the database
    var database = openDatabase(
      path.join(await getDatabasesPath(), 'favorite_study4.db'),
      onCreate: (db, version){
        db.execute(
            'CREATE TABLE favorite_study(address TEXT PRIMARY KEY, city TEXT)'
        );
      },
      version: 1,
    );
    return database;
  }
}