import 'package:flutter/material.dart';
import 'dart:io';

/**
 * Created by luhai on 2020/7/13
 * 数据库相关操作
 */
import 'package:sqflite/sqflite.dart';

class DBManager {
  static const int _VERSION = 1;
  static const String _DB_NAME = "testDB.db";
  static Database _database;

  // 初始化
  static init() async {
    var databasePath = await getDatabasesPath();
    String dbName = _DB_NAME;
    String path = databasePath + dbName;
    if (Platform.isIOS) {
      path = databasePath + "/" + dbName;
    }
    _database = await openDatabase(
        path, version: _VERSION,
        onCreate: (Database db, int version) async {
//          db.execute("CREATE TABLE Affairs(id INTEGER PRIMARY KEY, startTime TEXT, endTime INTEGER, icon TEXT, backgroundColor INTEGER, category TEXT)",);
        });
  }

  static isTableExists(String tableName) async {
    await getCurrentDatabase();
    String sql =
        "select * from Sqlite_master where type = 'table' and name = '$tableName'";
    var res = await _database.rawQuery(sql);
    return res != null && res.length > 0;
  }

  // 获取数据库实例
  static Future<Database> getCurrentDatabase() async {
    if(_database == null){
      await init();
    }
    return _database;
  }

  // 关闭数据库
  static close() {
    _database?.close();
    _database = null;
  }


}