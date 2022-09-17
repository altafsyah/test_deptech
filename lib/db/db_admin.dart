import 'package:deptech/admin_pref.dart';
import 'package:deptech/helper.dart';
import 'package:deptech/model/admin.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  static final DBAdmin instance = DBAdmin._init();

  static Database? _db;

  DBAdmin._init();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('db_admin.db');
    return _db!;
  }

  Future _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableAdmin(
      ${AdminField.id} $idType,
      ${AdminField.firstName} $textType,
      ${AdminField.lastName} $textType,
      ${AdminField.email} $emailType,
      ${AdminField.password} $textType
    )''');
  }

  Future<Admin> registerAdmin(Admin admin) async {
    final db = await instance.database;
    final id = await db.insert(tableAdmin, admin.toJson());
    AdminPref().setIdAdmin(id);
    return admin.copy(id: id);
  }

  Future<bool?> loginAdmin(String email, String password) async {
    final db = await instance.database;
    bool result = await db
        .rawQuery(
            "SELECT * FROM $tableAdmin WHERE ${AdminField.email} = '$email'")
        .then((value) {
      if (value.isEmpty) {
        return false;
      }
      final admin = value.first;
      print(admin[AdminField.email]);
      print(password == admin[AdminField.password]);
      if (password == admin[AdminField.password]) {
        AdminPref().setIdAdmin(admin[AdminField.id] as int);
        print("Berhasil");

        return true;
      }
      return false;
    });
    return result;
  }

  Future<Admin> readAdmin(int id) async {
    final db = await instance.database;
    final result = await db.query(tableAdmin, where: '${AdminField.id} = $id');

    return Admin.fromJson(result.first);
  }

  Future<int> update(Admin admin) async {
    final db = await instance.database;
    return db.update(tableAdmin, admin.toJson(),
        where: '${AdminField.id} = ${admin.id}');
  }

  Future<int> delete(Admin admin) async {
    final db = await instance.database;
    return db.delete(tableAdmin, where: '${AdminField.id} = ${admin.id}');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
