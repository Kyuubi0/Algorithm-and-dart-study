// lib/database/database_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper.internal();
  static Database? db;
  static const String dbName = 'mydb.db';

  factory DatabaseHelper() => instance;
  DatabaseHelper.internal();

  Future<Database> get database async {
    if (db != null) return db!;
    db = await initDatabase();
    return db!;
  }

  Future<Database> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    // Varolan db'yi sil db yapısal güncelleme
    /*if (await databaseExists(path)) {
      await File(path).delete();
      print("Eski veritabanı silindi.");
    }
*/
    // Veritabanı klasörünü oluştur
    await Directory(dirname(path)).create(recursive: true);

    try {
      // Assets'ten veritabanını kopyala
      ByteData data = await rootBundle.load(join('assets', 'database', dbName));
      List<int> bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes, flush: true);
      print("DB Created.");
    } catch (e) {
      print("Error: $e");
    }

    return await openDatabase(path);
  }

  // Students CRUD
  Future<List<Map<String, dynamic>>> getStudents() async {
    final database = await this.database;
    return await database.query('students', orderBy: 'name');
  }

  Future<int> insertStudent(Map<String, dynamic> student) async {
    final database = await this.database;
    return await database.insert('students', student);
  }

  Future<int> updateStudent(Map<String, dynamic> student) async {
    final database = await this.database;
    int id = int.parse(student['id'].toString());
    Map<String, dynamic> updateData = Map.from(student);
    updateData.remove('id');

    return await database.update(
      'students',
      updateData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(dynamic id) async {
    final database = await this.database;
    int studentId = int.parse(id.toString());
    return await database.delete(
      'students',
      where: 'id = ?',
      whereArgs: [studentId],
    );
  }
}
