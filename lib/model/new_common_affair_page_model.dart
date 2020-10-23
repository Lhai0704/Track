import 'package:flutter/material.dart';
import 'package:track/dao/tables_dao.dart';
import 'package:track/model/global_model.dart';

/**
 * Created by luhai on 2020/8/25
 */

class NewCommonAffairPageModel extends ChangeNotifier{

  BuildContext context;
  GlobalModel _globalModel;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void setContext(BuildContext context, {GlobalModel globalModel}) {
    if(this.context == null) {
      this.context = context;
      this._globalModel = globalModel;
      print("NewCommonAffairPageModel的setContext");
      Future.wait([
      ]).then((value) {
      });
    }
  }

  void insertAffair(CommonAffair commonAffair) {
    _globalModel.database.insertNewCommonAffair(commonAffair);
  }

}