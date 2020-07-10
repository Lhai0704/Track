/**
 * Created by luhai on 2020/7/9
 * 底部导航栏
 */

import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomBarState();
  }
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          title: Text('aa'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          title: Text('bb'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          title: Text('cc'),
        ),
      ],
    );
  }
}

