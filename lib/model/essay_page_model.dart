import 'dart:typed_data';
import 'dart:ui';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:track/dao/tables_dao.dart';

import 'global_model.dart';
/**
 * Created by luhai on 2020/7/20
 */

class EssayPageModel extends ChangeNotifier {
  GlobalModel globalModel;
  BuildContext context;

  void setContext(BuildContext context, {GlobalModel globalModel}) {
    if(this.context == null) {
      this.context = context;
      this.globalModel = globalModel;
      print("EssayPageModel的setContext");
      // Future.wait([
      //
      // ]).then((value) {
      //   refresh();
      // });
    }
  }


}