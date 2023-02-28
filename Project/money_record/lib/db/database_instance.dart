import 'dart:io';

import 'package:money_record/model/transaksi_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInstance {
  final String databaseName = "money_record.db";
  final int databaseVersion = 2;

  final String tableName = "transaksi";
  final String id = 'id';
  final String type = 'type';
  final String name = 'name';
  final String createdAt = 'created_at';
  final String updateAt = 'update_at';
  final String total = 'total';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory databaseDirectory = await getApplicationDocumentsDirectory();
    String path = join(databaseDirectory.path, databaseName);
    print("init database");
    return openDatabase(path, version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $name TEXT NULL, $type INTEGER, $total INTEGER, $createdAt TEXT NULL, $updateAt TEXT NULL)');
  }

  Future<List<TransaksiModel>> getAll() async {
    final data = await _database!.query(tableName);
    List<TransaksiModel> result =
        data.map((e) => TransaksiModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(tableName, row);
    return query;
  }

  Future<int> totalPemasukan() async {
    final query = await _database!
        .rawQuery("SELECT SUM(total) as total FROM $tableName WHERE type = 1");
    return int.parse(
      query.first['total'].toString(),
    );
  }

  Future<int> totalPengeluaran() async {
    final query = await _database!
        .rawQuery("SELECT SUM(total) as total FROM $tableName WHERE type = 2");
    return int.parse(
      query.first['total'].toString(),
    );
  }

  Future<int> hapus(idTransaksi) async {
    final query = await _database!
        .delete(tableName, where: '$id = ?', whereArgs: [idTransaksi]);
        return query;
  }

  Future<int> update(int idTransaksi, Map<String, dynamic> row)async{
    final query = await _database!.update(tableName, row, where: '$id = ?', whereArgs: [idTransaksi]);
    return query;
  }
}
