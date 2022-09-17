import 'package:deptech/helper.dart';
import 'package:deptech/model/karyawan.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBKaryawan {
  static final DBKaryawan instance = DBKaryawan._init();

  static Database? _db;

  DBKaryawan._init();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('db_karyawan.db');
    return _db!;
  }

  Future _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableKaryawan(
      ${KaryawanField.id} $idType,
      ${KaryawanField.firstName} $textType,
      ${KaryawanField.lastName} $textType,
      ${KaryawanField.email} $emailType,
      ${KaryawanField.noHp} $textType,
      ${KaryawanField.alamat} $textType,
      ${KaryawanField.jenisKelamin} $textType
    )''');
  }

  Future<Karyawan> createKaryawan(Karyawan kry) async {
    print(kry.jenisKelamin);
    final db = await instance.database;
    final id = await db.insert(tableKaryawan, kry.toJson());
    return kry.copy(id: id);
  }

  Future<Karyawan> readKaryawan(int id) async {
    final db = await instance.database;
    final result =
        await db.query(tableKaryawan, where: '${KaryawanField.id} = $id');

    return Karyawan.fromJson(result.first);
  }

  Future<List<Karyawan>> getKaryawan() async {
    final db = await instance.database;
    final result = await db.query(tableKaryawan);

    return result.map((e) {
      print(e);
      return Karyawan.fromJson(e);
    }).toList();
  }

  Future<int> update(Karyawan kry) async {
    final db = await instance.database;
    return db.update(tableKaryawan, kry.toJson(),
        where: '${KaryawanField.id} = ${kry.id}');
  }

  Future<int> delete(Karyawan kry) async {
    final db = await instance.database;
    return db.delete(tableKaryawan, where: '${KaryawanField.id} = ${kry.id}');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
