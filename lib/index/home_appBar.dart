/**
 * Created by luhai on 2020/7/9
 * 自定义appbar
 */

import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:track/index/calendar/calendar.dart';

class home_appBar extends StatefulWidget implements PreferredSizeWidget {
  final double contentHeight = kToolbarHeight;

  @override
  State<StatefulWidget> createState() {
    return _home_appBarState();
  }

  @override
  Size get preferredSize => new Size.fromHeight(contentHeight);

}

class _home_appBarState extends State<home_appBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Scaffold(
        body: Container(
          color: Colors.white,
          child: SafeArea(
            top: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: new Container(
//                    padding: EdgeInsets.only(left: 5.0),
                    child: IconButton(
                      icon: Icon(Icons.access_alarm),
                      onPressed: () {controller.toggleExpandStatus();},
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('今日计划'),
                      Text('7月10日'),
                    ],
                  ),
                ),
                Expanded(
                  child: new Container(
//                    padding: EdgeInsets.only(right: 5.0),
                    child: IconButton(
                      icon: Icon(Icons.access_alarm),
                      onPressed: null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

