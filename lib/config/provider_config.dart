import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:track/model/essay_page_model.dart';
import 'package:track/model/global_model.dart';
import 'package:track/model/main_page_model.dart';
import 'package:track/pages/essay_page.dart';
import 'package:track/pages/main_page.dart';

/**
 * Created by luhai on 2020/7/15
 * provider配置类
 */

class ProviderConfig {
  static ProviderConfig _instance;

  static ProviderConfig getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }

  ProviderConfig._internal();

  // 全局provider
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      create: (context) => GlobalModel(),
      child: child,
    );
  }

  // 主页provider
  ChangeNotifierProvider<MainPageModel> getMainPage() {
    return ChangeNotifierProvider<MainPageModel>(
      create: (context) => MainPageModel(),
      child: MainPage(),
    );
  }

  ChangeNotifierProvider<EssayPageModel> getEssayPage() {
    return ChangeNotifierProvider<EssayPageModel>(
      create: (context) => EssayPageModel(),
      child: EssayPage(),
    );
  }
}