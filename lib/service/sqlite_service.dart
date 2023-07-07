import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter_learn/model/user_model.dart';

class SqliteService {
  static final SqliteService instane = SqliteService._init();

  static Database? _database;

  SqliteService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableUser (
  ${UserFields.id} $idType,
  ${UserFields.name} $textType,
  ${UserFields.username} $textType,
  ${UserFields.email} $textType,
  ${UserFields.password} $textType,
  ${UserFields.time} $textType
)
''');
  }

  Future<User> create(User user) async {
    final db = await instane.database;

    final id = await db.insert(tableUser, user.toJson());
    return user.copy(id: id);
  }

  Future<User> readUser(int id) async {
    final db = await instane.database;

    final maps = await db.query(tableUser,
        columns: UserFields.values,
        where: '${UserFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('Id $id not found');
    }
  }

  Future<List<User>> readAllUser() async {
    final db = await instane.database;

    final orderBy = '${UserFields.time} ASC';
    final result = await db.query(tableUser, orderBy: orderBy);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User user,int id) async {
    final db = await instane.database;

    return db.update(tableUser, user.toJson(),
        where: '${UserFields.id} = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final db = await instane.database;

    return await db
        .delete(tableUser, where: '${UserFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instane.database;

    db.close();
  }
}
