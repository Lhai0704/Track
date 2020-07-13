/**
 * Created by luhai on 2020/7/12
 * 数据模型
 */


// To parse this JSON data, do
//
//     final affair = affairFromJson(jsonString);

import 'dart:convert';

Affair affairFromJson(String str) => Affair.fromJson(json.decode(str));

String affairToJson(Affair data) => json.encode(data.toJson());

class Affair {
  Affair({
    this.id,
    this.name,
    this.icon,
    this.backgroundColor,
    this.category,
  });

  String id;
  String name;
  String icon;
  int backgroundColor;
  String category;

  factory Affair.fromJson(Map<String, dynamic> json) => Affair(
    id: json['id'],
    name: json["name"],
    icon: json["icon"],
    backgroundColor: json["backgroundColor"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id":  id,
    "name": name,
    "icon": icon,
    "backgroundColor": backgroundColor,
    "category": category,
  };

  Map<String, dynamic> toMap() {
    return {
      "id":  id,
      "name": name,
      "icon": icon,
      "backgroundColor": backgroundColor,
      "category": category,
    };
  }

}

//// 事务
//class Affair {
//  final int id;
//  final String name;
//  final String icon;
//  final int backgroundColor;
//  final String category;
//
//  Affair({this.id, this.name, this.icon, this.backgroundColor, this.category});
//}
//
//// 模版
//class Template {
//  final String startTime;
//  final String endTime;
//  final String name;
//  final String icon;
//  final int backgroundColor;
//
//  Template({this.startTime, this.endTime, this.name, this.icon, this.backgroundColor});
//}
//
//// 已加入的计划
//class FullAffair {
//  final String startTime;
//  final String endTime;
//  final String name;
//  final String icon;
//  final int backgroundColor;
//
//  FullAffair({this.startTime, this.endTime, this.name, this.icon, this.backgroundColor});
//}
//
//// 随笔
//class Essay {
//  final String startTime;
//  final String endTime;
//  final String text;
//
//  Essay({this.startTime, this.endTime, this.text});
//}