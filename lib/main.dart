/**
* @Author: Lu Hai
* @Date: 2020/7/10
* @Description: 主界面
*/

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'global/BottomBar.dart';
import 'index/home_appBar.dart';
import 'index/calendar/calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'index/right_affairs.dart';

import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 720, height: 1280, allowFontScaling: true);
    return MaterialApp(
        home: new Scaffold(

          appBar: home_appBar(),
          bottomNavigationBar: BottomBar(),
          body: Container(
            child: Column(
              children: [
                calendar,
                Row(
                  children: [

                    RightAffairs(),
                  ],
                ),
              ],
            )
          ),
        ),
    );
  }
}
