/**
 * Created by luhai on 2020/8/26
 */

import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:track/entity/tables.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'tables_dao.g.dart';


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Affairs, CommonAffairs, Goals, Essays, Templates])
class TablesDao extends _$TablesDao {
  TablesDao() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Affair>> getAllAffairs() => select(affairs).get();
  Future insertNewAffair(Affair affair) => into(affairs).insert(affair);


  Future<List<CommonAffair>> getAllCommonAffairs() => select(commonAffairs).get();
  Future insertNewCommonAffair(CommonAffair commonAffair) => into(commonAffairs).insert(commonAffair);

  Future<List<Essay>> getAllEssays() => select(essays).get();
  Future insertNewEssay(Essay essay) => into(essays).insert(essay);
}
