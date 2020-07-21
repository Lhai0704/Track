/**
 * Created by luhai on 2020/7/15
 * 事务的json数据
 */
import 'dart:convert';
import 'affair_icon_bean.dart';

// 单个事务的json数据
class AffairBean {
  int id;
  String name;

  // 2012-02-27 13:27:00
  String startTime;
  String endTime;
  AffairIconBean affairIconBean;
  String affairType;
  int affairStatus;
  String remark;
  List<AffairDetailBean> detailList = [];

  AffairBean({
    this.name = "",
    this.affairType = "",
    this.startTime = "",
    this.endTime = "",
    this.affairIconBean,
    this.remark = "",
    this.affairStatus = AffairStatus.todo
  });

  Duration getDuration() {
    DateTime time1 = DateTime.parse(startTime);
    DateTime time2 = DateTime.parse(endTime);
    return time2.difference(time1);
  }

  static AffairBean fromMap(Map<String, dynamic> map) {
    AffairBean affairBean = new AffairBean();
    affairBean.id = map['id'];
    affairBean.name = map['name'];
    affairBean.startTime = map['startTime'];
    affairBean.endTime = map['endTime'];
    affairBean.affairType = map['affairType'];
    affairBean.affairStatus = map['affairStatus'];
    affairBean.remark = map['remark'];
    if (map['affairIconBean'] is String) {
      var taskIconBean = jsonDecode(map['affairIconBean']);
      affairBean.affairIconBean = AffairIconBean.fromMap(taskIconBean);
    }
    return affairBean;
  }

//  static AffairBean fromNetMap(Map<String, dynamic> map) {
//    AffairBean affairBean = new AffairBean();
//
//    return affairBean;
//  }

  static List<AffairBean> fromMapList(dynamic mapList) {
    List<AffairBean> list = new List(mapList.length);
    for (int i = 0 ; i < mapList.length ; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'startTime': startTime,
      'endTime': endTime,
      'affairIconBean': jsonEncode(affairIconBean.toMap()),
      'affairType': affairType,
      'affairStatus': affairStatus,
      'remark': remark
    };
  }

  @override
  String toString() {
    return 'AffairBean{id: $id, name: $name, startTime: $startTime, endTime: $endTime, affairIconBean: $affairIconBean, affairType: $affairType, affairStatus: $affairStatus, remark: $remark}';
  }
}

// 单个事务详情json数据
class AffairDetailBean {
  String affairDetailName;
  double itemProgress;

  AffairDetailBean({this.affairDetailName = "", this.itemProgress = 0.0});

  static AffairDetailBean fromMap(Map<String, dynamic> map) {
    AffairDetailBean taskDetailBean = new AffairDetailBean();
    taskDetailBean.affairDetailName = map['taskDetailName'];
    taskDetailBean.itemProgress = map['itemProgress'] is double ? map['itemProgress'] : double.parse(map['itemProgress']);
    return taskDetailBean;
  }

  static List<AffairDetailBean> fromMapList(dynamic mapList) {
    List<AffairDetailBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'affairDetailName': affairDetailName,
      'itemProgress': itemProgress.toString()
    };
  }
}

class AffairStatus {
  static const int todo = 0;
  static const int doing = 1;
  static const int done = 2;
  static const int essay = 3;
  static const int common = 4;
}










