import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:paysafev3/model/user.dart';

class UserDatabase{
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integerType = 'INTEGER TYPE NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute(
      '''CREATE TABLE $tableUser (
        ${UserFields.id} $idType, 
        ${UserFields.role} $integerType,
        ${UserFields.name} $textType,
        )
      '''
    );
  }

  Future<User> create(User user) async {
    final db = await instance.database;

    // final json = user.toJson();
    // final columns = '${UserFields.name}';
    // final values = '${json[UserFields.name]}';

    // final id = await db.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableUser, user.toJson());
    return user.copy(id:id);
  }

  

  Future close() async {
    final db = await instance.database;

    db.close();
  }
  
}