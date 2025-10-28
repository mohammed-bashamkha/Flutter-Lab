import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notes_app.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUpdate);
    return mydb;
  }

  _onUpdate(Database db, int oldVersion, int newVersion) {
    //database upgrade
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "notes" (
      "id" INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY ,
      "note" TEXT NOT NULL
    )
''');
    print('Create Table');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

}
