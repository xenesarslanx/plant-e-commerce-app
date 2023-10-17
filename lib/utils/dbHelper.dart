import 'package:path/path.dart';
import 'package:plant/model/plantsModel.dart';
import 'package:plant/model/userModel.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const _databaseName = "plantdb.db";
  // static const _databaseVersion = 1;
  static const _databaseNewVersion = 2;
  static const table = "plants_table";
  static const columnId = "id";
  static const columnName = "name";
  static const columnSize = "size";
  static const columnDescription = "description";
  static const columnPrice = "price";
  static const columnisFav = "isFav";
  static const columnimageList = "imageList";

  static const columnUserEmail = "userEmail";
  static const columnUserPassword = "userPassword";

  static final DBHelper _instance = DBHelper._internal();
  DBHelper._internal();

  factory DBHelper() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDB();
      return _database!;
    }
  }

  Future<void> _upgrade(
      Database db, int databaseVersion, int databaseVNewersion) async {
    if (databaseVersion < databaseVNewersion) {
      await db.execute('ALTER TABLE $table ADD COLUMN $columnUserEmail TEXT');
      await db
          .execute('ALTER TABLE $table ADD COLUMN $columnUserPassword TEXT');
    }
  }

  Future<Database> initDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);
    print(path);

    return await openDatabase(
      onUpgrade: _upgrade,
      path,
      version: _databaseNewVersion,
      onCreate: (Database db, int version) async {
        // Veritabanı tablosunu oluşturmak için SQL sorgusu
        await db.execute('''
          CREATE TABLE $table (
             $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
             $columnName TEXT,
            $columnSize TEXT,
            $columnDescription TEXT,
            $columnPrice REAL,
            $columnisFav INTEGER,
            $columnimageList TEXT,
            $columnUserEmail TEXT,
            $columnUserPassword TEXT

          )
        ''');
      },
    );
  }

  // Örnek: Veri eklemek için kullanabileceğiniz bir yöntem
  Future<int> insertData(Plants plants) async {
    final db = await database;
    return await db.insert(table, plants.toJson());
  }

  Future<int> insertDataUser(UserModel users) async {
    final db = await database;
    print("insert çalıstı dbhelper");
    return await db.insert(table, users.toJson());
  }
  /* // Örnek: Veriyi güncellemek için kullanabileceğiniz bir yöntem
  Future<int> updateData(Plants plants) async {
    final db = await database;
    int id = plants.toMap()["id"];
    return await db.update(_table, car.toMap(), 
    where: '$columnId = ?', whereArgs: [id]);
  }*/

  // Örnek: Veriyi silmek için kullanabileceğiniz bir yöntem
  Future<int> deleteData(int id) async {
    final db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

/*  // Örnek: Veriyi sorgulamak için kullanabileceğiniz bir yöntem
  Future<List<Map<String, dynamic>>> queryData(name) async {
    final db = await database;
    return await db.query(_table, where: "$columnName LIKE '%$name%'");
  }
Future<List<Map<String, dynamic>>> queryAllData() async {
    final db = await database;
    return await db.query(_table);
  }

  Future<int?> queryRowCount() async{
    final db = await database;
    return Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM $_table"));
  }*/
  Future<List<Map<String, dynamic>>> queryAllData() async {
    final db = await database;
    print("queryalldata calıstı");
    print(
      db.query(table),
    );
    return await db.query(table);
  }
}
