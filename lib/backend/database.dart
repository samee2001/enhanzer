import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'user_data.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userCode TEXT,
            displayName TEXT,
            email TEXT,
            employeeCode TEXT,
            companyCode TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> saveUser(Map<String, dynamic> userData) async {
    final db = await database;
    await db.insert('user', {
      'userCode': userData['User_Code'],
      'displayName': userData['User_Display_Name'],
      'email': userData['Email'],
      'employeeCode': userData['User_Employee_Code'],
      'companyCode': userData['Company_Code'],
    });
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('user');
  }
}
