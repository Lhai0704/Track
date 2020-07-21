/**
* @Author: Lu Hai
* @Date: 2020/7/10
* @Description: 主界面
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track/config/provider_config.dart';
import 'package:track/model/global_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(
    ProviderConfig.getInstance().getGlobal(MyApp()),
);


class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context)..setContext(context);
//    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: true);
    return MaterialApp(
      title: model.appName,
//      theme: ThemeUtil.,
      home: getHomePage(),
    );
  }

  Widget getHomePage() {
    return ProviderConfig.getInstance().getMainPage();
  }
}
