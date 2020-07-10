import 'dart:ffi';

/**
 * Created by luhai on 2020/7/9
 * 自定义appbar
 */

import 'package:flutter/material.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Positioned(
                  left: 0,
                  child: new Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: IconButton(
                      icon: Icon(Icons.access_alarm),
                      onPressed: null,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 9.0),
                  child: Column(
                    children: [
                      Text('今日计划'),
                      Text('7月10日'),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.only(right: 5.0),
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

