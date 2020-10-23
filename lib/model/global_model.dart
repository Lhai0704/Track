import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:track/dao/tables_dao.dart';
import 'package:track/logic/global_logic.dart';
import 'package:track/model/main_page_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track/model/new_affair_page_model.dart';


import 'new_common_affair_page_model.dart';

/**
 * Created by luhai on 2020/7/15
 */

class GlobalModel extends ChangeNotifier {
  GlobalLogic logic;
  BuildContext context;
  String appName = 'Track';

  TablesDao database;     // 数据库操作对象
  // DateModel selectDate = DateModel.fromDateTime(DateTime.parse("2020-10-18 09:00:56"));

  // 管理所有的model
  MainPageModel mainPageModel;
  NewAffairPageModel newAffairPageModel;
  NewCommonAffairPageModel newCommonAffairPageModel;

  GlobalModel() {
    logic = GlobalLogic(this);
  }

  void setContext(BuildContext context) {
    if(this.context == null) {
      this.context = context;
      Future.wait([
        logic.getDatabase(),      // 获取数据库
      ]).then((value) {
        refresh();

      });
    }
  }

  void setMainPageModel(MainPageModel mainPageModel) {
    if(this.mainPageModel == null){
      this.mainPageModel = mainPageModel;
      debugPrint('设置mainPageModel');
    }
  }

  void setNewAffairPageModel(NewAffairPageModel newAffairPageModel) {
    if(this.newAffairPageModel == null){
      this.newAffairPageModel = newAffairPageModel;
      debugPrint('设置newAffairPageModel');
    }
  }

  void setNewCommonAffairPageModel(NewCommonAffairPageModel newCommonAffairPageModel) {
    if(this.newCommonAffairPageModel == null){
      this.newCommonAffairPageModel = newCommonAffairPageModel;
      debugPrint('设置newCommonAffairPageModel');
    }
  }


  @override
  void dispose() {
    super.dispose();
    debugPrint('GlobalModel已销毁.');
  }

  void refresh() {
    notifyListeners();
  }
}