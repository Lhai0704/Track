import 'package:flutter/material.dart';
import 'package:track/logic/global_logic.dart';
import 'package:track/model/main_page_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * Created by luhai on 2020/7/15
 */

class GlobalModel extends ChangeNotifier {
  GlobalLogic logic;
  BuildContext context;
  String appName = 'Track';

  // 管理所有的model
  MainPageModel mainPageModel;

  GlobalModel() {
    logic = GlobalLogic(this);
  }

  void setContext(BuildContext context) {
    if(this.context == null) {
      this.context = context;
      Future.wait([
//        logic.getAppName(),

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

  @override
  void dispose() {
    super.dispose();
    debugPrint('GlobalModel已销毁.');
  }

  void refresh() {
    notifyListeners();
  }
}