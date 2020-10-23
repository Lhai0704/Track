/**
 * Created by luhai on 2020/10/8
 */
/**
 * Created by luhai on 2020/7/16
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track/config/provider_config.dart';

class NewAffairAppBar extends StatelessWidget {

  final Color color;
  NewAffairAppBar(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              padding: EdgeInsets.fromLTRB(32, 4, 100, 4),
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProviderConfig.getInstance().getEssayPage();
                }));
              }
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('添加常用事务', style: TextStyle(fontSize: 13),),
              Text('10月10日'),
            ],
          ),
          // IconButton(padding: EdgeInsets.fromLTRB(100, 4, 32, 4),
          //   icon: Icon(Icons.add),
          //   onPressed: null,
          // )
        ],
      ),
    );
  }
}
