import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
class DBHelper {
  DBHelper._();
  static final DBHelper instance = DBHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'train_reservation.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL,
            role TEXT NOT NULL
          )
        ''');

        await db.insert('users', {
          'username': 'admin',
          'password': '1234',
          'role': 'Admin',
        });

        await db.insert('users', {
          'username': 'staff',
          'password': '1234',
          'role': 'Staff',
        });
      },
    );
  }

  Future<Map<String, dynamic>?> login(String username, String password) async {
    final db = await database;

    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
      limit: 1,
    );

    if (result.isNotEmpty) return result.first;
    return null;
  }
}