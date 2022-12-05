import 'db_utils.dart';
import 'dart:async';
import 'GeoLocation.dart';
import 'package:sqflite/sqflite.dart';

class GeoLocation_model{
  Future<int> insertLocation(GeoLocation location) async{
    final db = await DBUtils.init();
    return db.insert(
      'favorite_study',
      location.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future getAllLocation() async{
    final db = await DBUtils.init();
    final List maps = await db.query('favorite_study');
    List result = [];
    for (int i = 0; i < maps.length; i++){
      result.add(
          GeoLocation.fromMap(maps[i])
      );
    }
    return result;
  }

  Future<int> updateLocation(GeoLocation location) async{
    final db = await DBUtils.init();
    return db.update(
      'favorite_study',
      location.toMap(),
      where: 'address = ?',
      whereArgs: [location.address],
    );
  }

  Future<int> deleteLocationWithAddress(String address) async{
    final db = await DBUtils.init();
    return db.delete(
      'favorite_study',
      where: 'address = ?',
      whereArgs: [address],
    );
  }
}