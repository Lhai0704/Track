import 'package:track/dao/tables_dao.dart';
import 'package:track/model/global_model.dart';
import 'package:http/http.dart' as http;
/**
 * Created by luhai on 2020/7/15
 */

class GlobalLogic {
  final GlobalModel _model;
  GlobalLogic(this._model);

  // 获取数据库
  Future getDatabase() async{
    final database = await TablesDao();
    _model.database = database;
  }
}
