/**
 * Created by luhai on 2020/7/16
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexAppBar extends StatelessWidget {

  final Color color;
  IndexAppBar(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(96),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(padding: EdgeInsets.fromLTRB(32, 2, 120, 2),icon: Icon(Icons.category), onPressed: null,),
          Column(

            children: [
              Text('aa'),
              Text('bb'),
            ],
          ),
          IconButton(padding: EdgeInsets.fromLTRB(120, 2, 32, 2),icon: Icon(Icons.add), onPressed: null,)
        ],
      ),
    );
  }
}
