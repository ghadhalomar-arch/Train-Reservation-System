import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

        // ===== Train =====
          await db.execute('''
           CREATE TABLE Train (
             trainId INTEGER PRIMARY KEY AUTOINCREMENT,
             trainNumber TEXT NOT NULL,
             source TEXT NOT NULL,
             destination TEXT NOT NULL,
             departureTime TEXT NOT NULL,
             arrivalTime TEXT NOT NULL,
             capacity INTEGER NOT NULL,
             availableSeats INTEGER NOT NULL,
             price REAL NOT NULL
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

    if (result.isEmpty) return null;
    return result.first;
  }

  // ===== Train CRUD =====

Future<int> addTrain(Map<String, dynamic> train) async {
  final db = await database;
  return await db.insert('Train', train);
}

Future<List<Map<String, dynamic>>> getAllTrains() async {
  final db = await database;
  return await db.query('Train');
}

Future<int> updateTrain(int trainId, Map<String, dynamic> train) async {
  final db = await database;
  return await db.update(
    'Train',
    train,
    where: 'trainId = ?',
    whereArgs: [trainId],
  );
}

Future<int> deleteTrain(int trainId) async {
  final db = await database;
  return await db.delete(
    'Train',
    where: 'trainId = ?',
    whereArgs: [trainId],
  );
}

bool validateCapacity(int capacity) {
  return capacity > 0;
}
س
bool validatePrice(double price) {
  return price > 0;
}

}