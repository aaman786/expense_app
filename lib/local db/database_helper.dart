
import 'package:flutter/cupertino.dart';
import 'package:my_budget/local%20db/model/db_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends ChangeNotifier {
  static const _dbName = 'expense.db';
  static const _dbVersion = 1;
  static const _tableName = 'expenseTable';

  static const columnId = '_id';
  static const columnBudgetName = '_name';
  static const columnDate = 'date';
  static const columnIcon = 'icon';
  static const columnPrice = 'price';

// making it a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database!;
    }

    _database = await _initiateDatabase();
    return _database!;
  }

  _initiateDatabase() async {
    print("initiatedb method...");
    String dbpath = await getDatabasesPath();
    print("The path of db is " + dbpath);
    // Directory directory = await getApplicationDocumentsDirectory();
    // String path = join(dbpath, _dbName);
    print("initiate method gets over...");
    notifyListeners(); 
    return await openDatabase(join(dbpath, _dbName),
        version: _dbVersion, onCreate: _onCreate);

  }

  Future _onCreate(Database db, int vesion) async {
    print("Oncreate method...");
    return await db.execute('''
create table $_tableName ( 
  $columnId integer primary key autoincrement, 
  $columnBudgetName text,
  $columnDate Date,
  $columnPrice Integer, 
  $columnIcon Text
  )
''');
  }

  Future<int> insert(DBModel dbModel) async {
    print("insert method...");
    Database db = await instance.database;
    return await db.insert(_tableName, dbModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;

    return await db.query(_tableName);

  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(_tableName, row,
        where: '$columnId = ? $columnBudgetName = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
