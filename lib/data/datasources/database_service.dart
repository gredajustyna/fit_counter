import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._();

  static final DatabaseService db = DatabaseService._();
  static Database? _database;

  Future<Database?> get database async {
    _database = await initDB();
    return _database;
  }

  initDB() async{
    return await openDatabase(
      join(await getDatabasesPath(), 'workouts_database.db'),
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE workouts(date TEXT, time TEXT, repetitions INT)');
      },
      version: 1,
    );
  }
}