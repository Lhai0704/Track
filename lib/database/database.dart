import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/data/affair_bean.dart';
import 'dart:async';

/**
 * Created by luhai on 2020/7/15
 * 数据库操作
 */

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "testDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        print("数据库版本: $version");
        await db.execute("CREATE TABLE Affairs ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name text,"
            "affairType text,"
            "affairStatus INTEGER,"
            "startTime TEXT,"
            "endTime TEXT,"
            "affairIconBean TEXT,"
            "remark TEXT"
            ");");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        print("新数据库版本: $newVersion");
        print("旧数据库版本: $oldVersion");
      },
    );
  }

  // 新建事务
  Future createAffair(AffairBean affair) async {
    final db = await database;
    affair.id = await db.insert("Affairs", affair.toMap());
  }

  // 根据完成进度查询所有任务，列：overallProgress
  Future<List<AffairBean>> getAffairs({bool isDone = false}) async {
    final db = await database;
    var list = await db.query("Affairs",
//      where: isDone ? " AND overallProgress >=",
    );
    List<AffairBean> beans = [];
    beans.clear();
    beans.addAll(AffairBean.fromMapList(list));
    return beans;
  }

  Future <List<AffairBean>> getAllAffairs() async {
    final db = await database;
    var list = await db.query("Affairs");
    List<AffairBean> beans = [];
    beans.clear();
    beans.addAll(AffairBean.fromMapList(list));
    return beans;
  }

  Future updateAffair(AffairBean affairBean) async {
    if(affairBean == null) return;
    final db = await database;
    await db.update("Affairs", affairBean.toMap(), where:  "id = ?", whereArgs: [affairBean.id]);
    debugPrint("update当前affair: ${affairBean.toMap()}");
  }

  Future deleteAffair(int id) async {
    final db = await database;
    db.delete("Affairs", where: "id = ?", whereArgs: [id]);
  }

  // 批量更新
  Future updateAffairs(List<AffairBean> affairBeans) async {
    final db = await database;
    final batch = db.batch();
    for (var affair in affairBeans) {
      batch.update("Affairs", affair.toMap(), where: "id = ?", whereArgs: [affair.id]);
    }
    final results = await batch.commit();
    print("批量更新: $results");
  }

  Future createAffairs(List<AffairBean> affairBeans) async {
    final db = await database;
    final batch = db.batch();
    for (var affair in affairBeans) {
      batch.insert("Affairs", affair.toMap());
    }
    final results = await batch.commit();
    print("批量创建: $results");
  }

}











