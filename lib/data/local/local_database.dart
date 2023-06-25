import 'package:n8_default_project/models/todo_model_for_sql/todo_model_sql.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("todos.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${ToDoModelFields.toDoTable} (
    ${ToDoModelFields.id} $idType,
    ${ToDoModelFields.categoryId} $intType,
    ${ToDoModelFields.title} $textType,
    ${ToDoModelFields.description} $textType,
    ${ToDoModelFields.createdAt} $textType,
    ${ToDoModelFields.expiredDate} $textType,
    ${ToDoModelFields.toDoImportance} $intType,
    ${ToDoModelFields.status} $intType
    )
    ''');

    // '''
    //  CREATE TABLE toDoTAble (_id INTEGER PRIMARY KEY AUTOINCREMENT, )
    // '''
  }

  static Future<ToDoModelSql> insertTodo(ToDoModelSql toDo) async {
    final db = await getInstance.database;
    final id = await db.insert(ToDoModelFields.toDoTable, toDo.toJson());
    return toDo.copyWith(id: id);
  }
}
