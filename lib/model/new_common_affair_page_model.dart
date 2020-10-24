import 'package:flutter/material.dart';
import 'package:track/dao/tables_dao.dart';
import 'package:track/model/global_model.dart';

/**
 * Created by luhai on 2020/8/25
 */

class NewCommonAffairPageModel extends ChangeNotifier{

  BuildContext context;
  GlobalModel _globalModel;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Affair> affairs = List<Affair>();

  void setContext(BuildContext context, {GlobalModel globalModel}) {
    if(this.context == null) {
      this.context = context;
      this._globalModel = globalModel;
      print("NewCommonAffairPageModel的setContext");
      Future.wait([
      ]).then((value) {
      });
    }
  }


  // 获取所有affairs
  Future<List<Affair>> getAllAffairs() async {
    List<Affair> a = new List<Affair>();
    a = await _globalModel.database.getAllAffairs();
    return a;
  }

  void insertAffair(CommonAffair commonAffair) {
    _globalModel.database.insertNewCommonAffair(commonAffair);
  }

  Future<List<Widget>> getAffairsWidgetList(context) async {
    int i;
    List<Affair> affairs = new List<Affair>();
    await getAllAffairs().then((value) {
      i = value.length;
      affairs.addAll(value);
    });

    return List.generate(i, (index) {
      final a = affairs[index];
      return Column(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Color(a.color),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.black, width: 0.5),
            ),
            child: Container(
              child: IconButton(
                icon: Icon(IconData(a.icon, fontFamily: 'MyFlutterApp'), color: Colors.black, size: 18,),
                onPressed: null,
              ),
            ),
          ),
          Text("${a.name}"),
        ],
      );
    });
  }

}