import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track/data/affair_bean.dart';
import 'package:track/data/affair_icon_bean.dart';
import 'package:track/data/color_bean.dart';
import 'package:track/database/database.dart';
import 'package:track/items/affair_item.dart';
import 'package:track/model/main_page_model.dart';
import 'package:intl/intl.dart';

/**
 * Created by luhai on 2020/7/15
 */

class MainPageLogic {
  final MainPageModel _model;

  MainPageLogic(this._model);

  List<Widget> getCards(context) {
    return List.generate(_model.affairs.length, (index) {
      final affairBean = _model.affairs[index];
      return Container(
        color: Colors.amberAccent,
        height: affairBean.getDuration().inMinutes.toDouble(),
        width: 200,
        child: AffairItem(affairBean.id, affairBean),
      );
    });
  }


  Future getAffairs() async {
    final affairs = await DBProvider.db.getAllAffairs();
    if(affairs == null) return;
    _model.affairs.clear();
    _model.affairs.addAll(affairs);
    print("${_model.affairs.toString()}");
  }


  // 添加一个affair（没学过测试，将就着用）
  Future addAffair() async {
    IconBean iconBean = IconBean(iconName: "a", fontPackage: "a", fontFamily: "a", codePoint: 1);
    AffairIconBean affairIconBean = AffairIconBean(affairName: "testAffair", colorBean: ColorBean.fromColor(Colors.white), iconBean: iconBean);
    AffairBean affairBean = AffairBean(name: "testAffair", startTime: "2012-02-27 13:27:00", endTime: "2012-02-27 14:45:35", affairIconBean: affairIconBean, affairStatus: 1, affairType: "学习", remark: "remark");
    await DBProvider.db.createAffair(affairBean);
  }


}