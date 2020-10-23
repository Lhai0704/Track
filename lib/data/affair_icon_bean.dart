import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_bean.dart';

/**
 * Created by luhai on 2020/7/15
 * 图标
 */

class AffairIconBean {
  String affairName;
  IconBean iconBean;
  ColorBean colorBean;

  AffairIconBean({this.affairName, this.iconBean, this.colorBean});

  static AffairIconBean fromMap(Map<String, dynamic> map) {
    AffairIconBean bean = new AffairIconBean();
    bean.affairName = map['affairName'];
    bean.iconBean = IconBean.fromMap(map['iconBean']);
    return bean;
  }

  static List<AffairIconBean> fromMapList(dynamic mapList) {
    List<AffairIconBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length ; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'affairName': affairName,
      'iconBean': iconBean.toMap(),
      'colorBean': colorBean.toMap(),
    };
  }
}

class IconBean {
  int codePoint;
  String fontFamily;
  String fontPackage;
  String iconName;

  IconBean({
    this.codePoint,
    this.fontFamily,
    this.fontPackage,
    this.iconName});


  static IconData fromBean(IconBean bean) =>
      IconData(bean.codePoint, fontFamily: bean.fontFamily);

  static IconBean fromMap(Map<String, dynamic> map) {
    IconBean bean = new IconBean();
    bean.codePoint = map['codePoint'] is int ? map['codePoint'] : int.parse(map['codePoint']);
    bean.fontFamily = map['fontFamily'];
    bean.fontPackage = map['fontPackage'];
    bean.iconName = map['iconName'];
    return bean;
  }

  static IconBean fromIconData(IconData iconData) {
    return IconBean(
      codePoint: iconData.codePoint,
      fontFamily: iconData.fontFamily,
      fontPackage: iconData.fontPackage,
    );
  }

  static List<IconBean> fromMapList(dynamic mapList) {
    List<IconBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  static Future<List<IconBean>> loadAsset() async {
    String json = await rootBundle.loadString('local_json/icon_json.json');
    return IconBean.fromMapList(jsonDecode(json));
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'codePoint': codePoint.toString(),
      'fontFamily': fontFamily ?? "",
      'fontPackage': fontPackage ?? "",
      'iconName': iconName ?? ""
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'codePoint': codePoint.toString(),
      'fontFamily': fontFamily ?? "",
      'fontPackage': fontPackage ?? "",
      'iconName': iconName ?? ""
    };
  }

}