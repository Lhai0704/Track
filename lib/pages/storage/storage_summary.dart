/**
 * Created by luhai on 2020/9/15
 */

import 'package:flutter/material.dart';

class StorageSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: new Border.all(color: Colors.black, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        child: Row(
          children: [
            Text("生活"),
            Text("Living"),
            Column(
              children: [
                Icon(Icons.star),
                Text("30"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
