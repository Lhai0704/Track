/**
 * Created by luhai on 2020/7/15
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track/model/global_model.dart';
import 'package:track/model/main_page_model.dart';
import 'package:track/widgets/index_app_bar.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import 'package:track/widgets/index_calendar.dart';

class MainPage extends StatefulWidget {

  @override
  State createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MainPageModel>(context);
    final globalModel = Provider.of<GlobalModel>(context);
    model.setContext(context, globalModel: globalModel);
    globalModel.setMainPageModel(model);


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IndexAppBar(Colors.white),
              calendar,

              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: model.logic.getCards(context),
              ),
            ],
          ),

        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(items: [
//
//      ],),
    );
  }
}
