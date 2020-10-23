import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track/dao/tables_dao.dart';
import 'package:track/data/affair_bean.dart';
import 'package:track/model/global_model.dart';
import 'package:track/widgets/affair_info_widget.dart';

/**
 * Created by luhai on 2020/7/17
 */

class AffairItem extends StatelessWidget {
  Affair affair;
  AffairItem(this.affair);

  @override
  Widget build(BuildContext context) {
    final globalModel = Provider.of<GlobalModel>(context);
    double topPadding = affair.startTime.difference(affair.endTime).inMinutes.toDouble();


    if(affair.checked == 0){
      // 未打卡
      return Container(
        padding: EdgeInsets.only(top: topPadding),
        child: Row(
          children: [
            // Icon(),
            Text("${affair.name}"),
            IconButton(icon: null, onPressed: null)
          ],
        ),
      );
    }else{
      return Container(
        padding: EdgeInsets.only(top: topPadding),
        child: Row(
          children: [
            // Icon(),
            Text("${affair.name}"),
            IconButton(icon: null, onPressed: null)
          ],
        ),
      );
    }

  }
}



















