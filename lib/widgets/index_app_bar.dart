/**
 * Created by luhai on 2020/7/16
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track/config/provider_config.dart';

class IndexAppBar extends StatelessWidget {

  final Color color;
  IndexAppBar(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: 50,
//      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            padding: EdgeInsets.fromLTRB(32, 2, 120, 2),
            icon: Icon(Icons.category),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProviderConfig.getInstance().getEssayPage();
              }));
            }
          ),
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
