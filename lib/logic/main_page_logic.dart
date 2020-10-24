import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import 'package:provider/provider.dart';
import 'package:track/dao/tables_dao.dart';
import 'package:track/data/affair_bean.dart';
import 'package:track/data/affair_icon_bean.dart';
import 'package:track/data/color_bean.dart';
import 'package:track/entity/tables.dart';
import 'package:track/items/affair_item.dart';
import 'package:track/model/calendar_model.dart';
import 'package:track/model/global_model.dart';
import 'package:track/model/main_page_model.dart';

import 'package:track/config/provider_config.dart';

/**
 * Created by luhai on 2020/7/15
 */

class MainPageLogic {
  final MainPageModel _model;

  MainPageLogic(this._model);

  // 返回widget列表（常用事务）
  // List<Widget> getCommonAffairsWidget(context) {
  //   return List.generate(length, (index) => null)
  // }

  // 获取affairs列表（主体部分）
  Future<List<Widget>> getAffairs(context) async {
    int i;
    List<Affair> affairs = new List<Affair>();
    await _model.getAllAffairs().then((value) {
      i = affairs.length;
      affairs.addAll(value);
    });
    return List.generate(i, (index) {
      return Container(
        child: AffairItem(affairs[index]),
      );
    });
  }

  // 获取常用事务数据列表
  Future<List<Widget>> getCommonAffairs(context) async {
    int i;
    List<CommonAffair> commonAffairs = new List<CommonAffair>();
    await _model.getAllCommonAffairs().then((value) {
      i = value.length;
      commonAffairs.addAll(value);
    });

    return List.generate(i, (index) {
      final a = commonAffairs[index];
      print(a);
      return Draggable(
        childWhenDragging: Container(
          child: Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(a.color),
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  child: IconButton(
                    icon: Icon(IconData(a.icon, fontFamily: 'MyFlutterApp')),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProviderConfig.getInstance().getNewAffairPage(a.icon, a.color);
                          }));
                    },
                  ),
                ),
              ),
              Text("${a.name}"),
            ],
          ),
        ),
        // 拖出来的
        feedback: Container(
          child: Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(a.color),
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  child: IconButton(
                    icon: Icon(IconData(a.icon, fontFamily: 'MyFlutterApp')),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProviderConfig.getInstance().getNewAffairPage(a.icon, a.color);
                          }));
                    },
                  ),
                ),
              ),
              Text("${a.name}", style: TextStyle(color: Colors.black, fontSize: 12),),
            ],
          ),
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(a.color),
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  child: IconButton(
                    icon: Icon(IconData(a.icon, fontFamily: 'MyFlutterApp')),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProviderConfig.getInstance().getNewAffairPage(a.icon, a.color);
                          }));
                    },
                  ),
                ),
              ),
              Text("${a.name}"),
            ],
          ),
        ),
        onDragEnd: (detail) {
          print(
              "Draggable onDragEnd ${detail.velocity.toString()} ${detail.offset.toString()}");
        },

      );
    });
  }


  // List<Widget> getCommonAffairs() {
  //   return List.generate(_model., (index) => null)
  // }

  // Future getAffairs() async {
  //   final affairs = await DBProvider.db.getAllAffairs();
  //   if(affairs == null) return;
  //   _model.affairs.clear();
  //   _model.affairs.addAll(affairs);
  //   print("${_model.affairs.toString()}");
  // }

  // // 添加一个affair（没学过测试，将就着用）
  // Future addAffair() async {
  //   IconBean iconBean = IconBean(iconName: "a", fontPackage: "a", fontFamily: "a", codePoint: 1);
  //   AffairIconBean affairIconBean = AffairIconBean(affairName: "testAffair", colorBean: ColorBean.fromColor(Colors.white), iconBean: iconBean);
  //   AffairBean affairBean = AffairBean(name: "testAffair", startTime: "2012-02-27 13:27:00", endTime: "2012-02-27 14:45:35", affairIconBean: affairIconBean, affairStatus: 1, affairType: "学习", remark: "remark");
  //   await DBProvider.db.createAffair(affairBean);
  // }

}


