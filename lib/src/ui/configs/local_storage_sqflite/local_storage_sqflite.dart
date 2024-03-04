import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../generic/exports/space_exports.dart';
import 'sqflite_model.dart';

class LocalStorageSqfLite {
  static late Database _database;

  static Future<void> initDatabase() async {
    try {
      final databasesPath = await getDatabasesPath();
      final path = join(databasesPath, 'data.db');

      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE data(key TEXT PRIMARY KEY, value TEXT)',
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> insertData(Data data) async {
    try {
      final Data? currentDataItem = await getDataByKey(data.key);
      if (currentDataItem != null) {
        await _database.update(
          'data',
          data.toMap(),
          where: 'key = ?',
          whereArgs: [data.key],
        );
      } else {
        await _database.insert('data', data.toMap());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<Data>> getAllDataRows() async {
    final List<Map<String, dynamic>> maps = await _database.query('data');
    return List.generate(maps.length, (i) {
      return Data(
        key: maps[i]['key'].toString(),
        value: maps[i]['value'].toString(),
      );
    });
  }

  static Future<Data?> getDataByKey(String key) async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(
        'data',
        where: 'key = ?',
        whereArgs: [key],
      );

      if (maps.isNotEmpty) {
        return Data(
          key: maps[0]['key'].toString(),
          value: maps[0]['value'].toString(),
        );
      } else {
        return null; // No task found with the specified ID
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<void> updateData(
    Data data,
  ) async {
    try {
      await _database.update(
        'data',
        data.toMap(),
        where: 'key = ?',
        whereArgs: [data.key],
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> deleteData(String key) async {
    try {
      await _database.delete(
        'data',
        where: 'key = ?',
        whereArgs: [key],
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
