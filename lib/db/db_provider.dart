import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:track/db/db_manager.dart';
import 'package:track/dao/affairDao.dart';

/**
 * Created by luhai on 2020/7/13
 * 数据表操作基类
 */

abstract class BaseDBProvider {
  bool isTableExists = false;

  tableSqlString();
  tableName();

  tableBaseString(String name, String columnId) {
    return '''
      create table $name (
      $columnId integer primary key autoincrement,
    ''';
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  @mustCallSuper
  prepare(name, String createSql) async {
    isTableExists = await DBManager.isTableExists(name);
    if (!isTableExists) {
      Database db = await DBManager.getCurrentDatabase();
      return db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExists){
      await prepare(tableName(), tableSqlString());
    }
    return await DBManager.getCurrentDatabase();
  }

}