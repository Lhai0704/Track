/**
 * Created by luhai on 2020/7/13
 * 右侧事务列
 */
import 'package:flutter/material.dart';
import 'package:track/dao/affairDao.dart';
import 'package:track/global/DataBase.dart';
import 'package:track/global/Model.dart';

class RightAffairs extends StatefulWidget {



  RightAffairs({
    Key key,
    this.item,
  }) : super(key: key);
  String item;

  @override
  _RightAffairsState createState() => _RightAffairsState();
}

class _RightAffairsState extends State<RightAffairs> {

  // 插入affair数据
  Future insertAffair() async {
    AffairDao dao = new AffairDao();
    Affair test = new Affair(
        id: "a",
        name: "学习",
        icon: "a",
        backgroundColor: 123,
        category: "a"
    );
    await dao.insert(test);
  }

  // 获取Affairs列表
  Future<String> queryAffairById() async {
    AffairDao dao = new AffairDao();
    Affair affair = await dao.getMessageById("a");
    return affair.toJson().toString();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    insertAffair();

    return FutureBuilder(
      future: queryAffairById(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){
        return Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('${snapshot.data.substring(1)}'),
        );
      },
    );
  }
}
