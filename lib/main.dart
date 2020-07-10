/**
* @Author: Lu Hai
* @Date: 2020/7/10
* @Description: 主界面
*/

import 'package:flutter/material.dart';
import 'global/BottomBar.dart';
import 'index/home_appBar.dart';

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
    return MaterialApp(
        home: new Scaffold(
          appBar: home_appBar(),
          bottomNavigationBar: BottomBar(),
        ),
    );
  }
}
