import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track/data/affair_icon_bean.dart';
import 'package:track/data/color_bean.dart';
import 'dart:convert';

import 'package:track/util/theme_util.dart';

/**
 * Created by luhai on 2020/7/16
 */

class IconListUtil {
  static IconListUtil _instance;

  static IconListUtil getInstance() {
    if(_instance == null) {
      _instance = IconListUtil._internal();
    }
    return _instance;
  }

  IconListUtil._internal();

  List<AffairIconBean> getDefaultIcons(BuildContext context) {
    return [AffairIconBean(
      affairName: "affairTest",
      iconBean: IconBean.fromIconData(Icons.music_note),
      colorBean: ColorBean.fromColor(MyThemeColor.coffeeColor)),
      AffairIconBean(
          affairName: "affairTest",
          iconBean: IconBean.fromIconData(Icons.music_note),
          colorBean: ColorBean.fromColor(MyThemeColor.coffeeColor)),
      AffairIconBean(
          affairName: "affairTest",
          iconBean: IconBean.fromIconData(Icons.music_note),
          colorBean: ColorBean.fromColor(MyThemeColor.coffeeColor)),
      AffairIconBean(
          affairName: "affairTest",
          iconBean: IconBean.fromIconData(Icons.music_note),
          colorBean: ColorBean.fromColor(MyThemeColor.coffeeColor)),];
  }

  Future<List<AffairIconBean>> getIcon(BuildContext context) async {

  }
}