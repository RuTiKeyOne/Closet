import 'package:closet/core/data/db/users_db.dart';
import 'package:closet/core/data/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabaseImpl implements UserDatabase {
  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();
  static final UserDatabaseImpl instance =
      UserDatabaseImpl._privateConstructor();
  UserDatabaseImpl._privateConstructor();

  Future<Database> _initDatabase() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'users.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        login TEXT NOT NULL,
        password TEXT NOT NULL
      )
      ''');
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final db = await instance.database;
    final habitsQuery = await db.query('users');

    List<UserModel> habits = habitsQuery.isNotEmpty
        ? habitsQuery.map((e) => UserModel.fromMap(e)).toList()
        : [];

    return habits;
  }

  @override
  Future<int> add(UserModel user) async {
    final db = await instance.database;
    return db.insert('users', user.toMap());
  }

  @override
  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> update(UserModel user) async {
    final db = await instance.database;

    return await db
        .update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }
}
