import 'package:flutter/material.dart';
import 'package:track/data/affair_bean.dart';
import 'package:track/logic/main_page_logic.dart';
import 'package:track/model/global_model.dart';

/**
 * Created by luhai on 2020/7/15
 */

class MainPageModel extends ChangeNotifier {
  MainPageLogic logic;
  BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<AffairBean> affairs = [];

  // 销毁GlobalModel里面的mainPageModel
  GlobalModel _globalModel;

  MainPageModel() {
    logic = MainPageLogic(this);
  }

  void setContext(BuildContext context, {GlobalModel globalModel}) {
    if(this.context == null) {
      this.context = context;
      this._globalModel = globalModel;
      print("主页面model的setContext");
      Future.wait([
        logic.addAffair(),
        logic.getAffairs(),
      ]).then((value) {
        refresh();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

  }

  void refresh() {
    notifyListeners();
  }
}