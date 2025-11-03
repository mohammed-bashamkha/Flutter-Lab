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
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 2, onUpgrade: _onUpdate);
    return mydb;
  }

  _onUpdate(Database db, int oldVersion, int newVersion)  async{
    await db.execute('ALTER TABLE notes ADD COLUMN title TEXT');
    await db.execute('ALTER TABLE notes ADD COLUMN color TEXT');
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "notes" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
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

  Future<List<Map>> readDataApp() async {
    List<Map> response = await readData("SELECT * FROM notes");
    return response;
  }
}
