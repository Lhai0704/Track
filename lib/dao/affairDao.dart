import 'package:sqflite/sqflite.dart';
import 'package:track/db/db_provider.dart';
import 'package:track/global/DataBase.dart';
import 'package:track/db/db_provider.dart';
import 'package:track/global/Model.dart';

/**
 * Created by luhai on 2020/7/13
 * affair数据处理类
 */

class AffairDao extends BaseDBProvider {
  final String name = "affairs";
  final String columnId = "_id";

  @override
  tableName() {
    return name;
  }

  @override
  tableSqlString() {
    return tableBaseString(name, columnId) +
    '''
    id text not null,
    name text,
    icon text,
    backgroundColor integer,
    category text)
    ''';
  }

  Future insert(Affair affair) async {
    Database db = await getDataBase();
    return await db.insert(name, toMap(affair));
  }

  Future<Affair> getMessageById(String id) async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps = await db.query(name, where: "id = ?", whereArgs: [id]);
    if(maps.length > 0){
      Affair affair = Affair.fromJson(maps.first);
      return affair;
    }
    return null;
  }

  Future<List<Affair>> getAffairsList() async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps = await db.query(name);
    if(maps.length > 0){
      List<Affair> affairs =
          maps.map((item) => Affair.fromJson(item)).toList();
      return affairs;
    }
    return null;
  }

  Map<String, dynamic> toMap(Affair affair){
    Map<String, dynamic> map = {
      "id": affair.id,
      "name": affair.name,
      "icon": affair.icon,
      "backgroundColor": affair.backgroundColor,
      "category": affair.category
    };
    return map;
  }
}