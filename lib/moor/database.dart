import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

/**
 * Created by luhai on 2020/8/28
 */


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}