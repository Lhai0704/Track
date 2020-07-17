import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track/data/affair_bean.dart';
import 'package:track/data/affair_icon_bean.dart';
import 'package:track/data/color_bean.dart';
import 'package:track/database/database.dart';
import 'package:track/items/affair_item.dart';
import 'package:track/model/main_page_model.dart';

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
        height: 200,
        width: 200,
        child: AffairItem(affairBean.id, affairBean),
      );
    });
  }


  Future getAffairs() async {
    final affairs = await DBProvider.db.getAffairs();
    if(affairs == null) return;
    _model.affairs.clear();
    _model.affairs.addAll(affairs);
  }


  Future addAffair() async {
    IconBean iconBean = IconBean(iconName: "a", fontPackage: "a", fontFamily: "a", codePoint: 1);
    print("${iconBean.toMap()}");
    AffairIconBean affairIconBean = AffairIconBean(affairName: "testAffair", colorBean: ColorBean.fromColor(Colors.white), iconBean: iconBean);
    print("${affairIconBean.toMap()}");
    AffairBean affairBean = AffairBean(name: "testAffair", startTime: "startTime", endTime: "endTime", affairIconBean: affairIconBean, affairStatus: 1, affairType: "学习", remark: "remark");
    print("${affairBean.toMap()}");
    await DBProvider.db.createAffair(affairBean);
  }


}