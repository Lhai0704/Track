import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import 'package:track/data/affair_bean.dart';
import 'package:track/logic/main_page_logic.dart';
import 'package:track/model/global_model.dart';
import 'package:track/dao/tables_dao.dart';

/**
 * Created by luhai on 2020/7/15
 */

class MainPageModel extends ChangeNotifier {
  MainPageLogic logic;
  BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  // DateModel _selectDate = DateModel.fromDateTime(DateTime.parse("2020-10-19 09:00:56"));
  // DateModel get value => _selectDate;
  // void selectDate(CalendarController controller) {
  //   controller..addOnCalendarSelectListener((dateModel) {
  //     _selectDate = dateModel;
  //     print("$_selectDate");
  //     // notifyListeners();
  //     refresh();
  //   });
  // }


  // 销毁GlobalModel里面的mainPageModel
  GlobalModel globalModel;

  MainPageModel() {
    logic = MainPageLogic(this);
  }

  void setContext(BuildContext context, {GlobalModel globalModel}) {
    if(this.context == null) {
      this.context = context;
      this.globalModel = globalModel;
      print("主页面model的setContext");
      Future.wait([

      ]).then((value) {
        refresh();
      });
    }
  }
  
  // 获取所有affairs
  Future<List<Affair>> getAllAffairs() async {
    List<Affair> a = new List<Affair>();
    a = await globalModel.database.getAllAffairs();
    return a;
  }

  // 获取所有右侧常用affairs
  Future<List<CommonAffair>> getAllCommonAffairs() async {
    List<CommonAffair> a = new List<CommonAffair>();
    a = await globalModel.database.getAllCommonAffairs();
    return a;
  }
  


  // 添加一个affair
  Future addAffair1() async {
    Affair affair = new Affair(id: null, startTime: DateTime.now(), endTime: DateTime.parse("2012-02-27 13:27:00"), category: 1, remark: "aaa", name: "看书", color: 0xFFFBC48F, icon: 0xe801, checked: 1);
    await globalModel.database.insertNewAffair(affair);
    print("添加一个affair");
  }
  
  // 添加一个commonaffairs
  Future addCommonAffair() async {
    CommonAffair commonAffair = new CommonAffair(id: null, icon: 0xe802, color: 0xFFFBC48F, name: "学习", category: 1, remark: "备注");
    await globalModel.database.insertNewCommonAffair(commonAffair);
    print("添加一个commonaffair");
  }


  @override
  void dispose() {
    super.dispose();
  }

  void refresh() {
    notifyListeners();
    print('这里是notifyListeners()');
  }
}