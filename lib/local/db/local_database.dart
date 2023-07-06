import 'package:flutter/cupertino.dart';
import 'package:n8_default_project/models/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("contacts.db");
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
    CREATE TABLE ${ProductModelFields.contactsTable} (
    ${ProductModelFields.id} $idType,
    ${ProductModelFields.title} $textType,
    ${ProductModelFields.img} $textType,
    ${ProductModelFields.price} $textType,
    ${ProductModelFields.skidka} $textType,
    ${ProductModelFields.count} $intType,
    ${ProductModelFields.isTapped} $intType,
    ${ProductModelFields.isLiked} $intType,
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<ProductsModel> insertContact(
      ProductsModel contactsModelSql) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        ProductModelFields.contactsTable, contactsModelSql.toJson());
    return contactsModelSql.copyWith(id: id);
  }

  static Future<List<ProductsModel>> getAllContacts() async {
    List<ProductsModel> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(ProductModelFields.contactsTable))
        .map((e) => ProductsModel.fromJson(e))
        .toList();

    return allToDos;
  }

  static deleteContact(int id) async {
    final db = await getInstance.database;
    db.delete(
      ProductModelFields.contactsTable,
      where: "${ProductModelFields.id} = ?",
      whereArgs: [id],
    );
  }

  static updateIsLiked({required int id, required int isLike}) async {
    final db = await getInstance.database;
    db.update(
      ProductModelFields.contactsTable,
      {ProductModelFields.isLiked: isLike},
      where: "${ProductModelFields.id} = ?",
      whereArgs: [id],
    );
  }

  static updateIsTapped({required int id, required int isTapped}) async {
    final db = await getInstance.database;
    db.update(
      ProductModelFields.contactsTable,
      {ProductModelFields.isTapped: isTapped},
      where: "${ProductModelFields.id} = ?",
      whereArgs: [id],
    );
  }

  static deleteAllContacts() async {
    final db = await getInstance.database;
    db.delete(
      ProductModelFields.contactsTable,
    );
  }


  static Future<List<ProductsModel>> getSearchContact(String query) async {
    List<ProductsModel> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(ProductModelFields.contactsTable,where: "${ProductModelFields.title} like ?", whereArgs: ["$query%"]))
        .map((e) => ProductsModel.fromJson(e))
        .toList();

    return allToDos;
  }

  static Future<ProductsModel?> getSingleContact(int id) async {
    List<ProductsModel> contacts = [];
    final db = await getInstance.database;
    contacts = (await db.query(
      ProductModelFields.contactsTable,
      where: "${ProductModelFields.id} = ?",
      whereArgs: [id],
    ))
        .map((e) => ProductsModel.fromJson(e))
        .toList();

    if (contacts.isNotEmpty) {
      return contacts.first;
    }
  }

  static Future<List<ProductsModel>> getContactsByQuery(String query) async {
    List<ProductsModel> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(
      ProductModelFields.contactsTable,
      where: "${ProductModelFields.title} LIKE ?",
      whereArgs: [query],
    ))
        .map((e) => ProductsModel.fromJson(e))
        .toList();
    return allToDos;
  }
}