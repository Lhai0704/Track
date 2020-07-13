import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

import 'Model.dart';

/**
 * Created by luhai on 2020/7/13
 */

class Global  {

  static Future init() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'testDB.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Affairs(id INTEGER PRIMARY KEY, startTime TEXT, endTime INTEGER, icon TEXT, backgroundColor INTEGER, category TEXT)",
        );
      },
      version: 1,
    );

  }


}