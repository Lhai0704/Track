import 'dart:ui';

/**
 * Created by luhai on 2020/7/15
 *
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track/config/my_flutter_app_icons.dart';
import 'package:track/config/provider_config.dart';
import 'package:track/dao/tables_dao.dart';
import 'package:track/model/calendar_model.dart';
import 'package:track/model/global_model.dart';
import 'package:track/model/main_page_model.dart';
import 'package:track/pages/my.dart';
import 'package:track/pages/statistic.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import 'dart:io';

class MainPage extends StatefulWidget {
  @override
  State createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  // 日历
  CalendarController controller;
  CalendarViewWidget calendar;
  DateModel selectDate =
      DateModel.fromDateTime(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MainPageModel>(context);
    final globalModel = Provider.of<GlobalModel>(context);
    model.setContext(context, globalModel: globalModel);
    globalModel.setMainPageModel(model);

    ScrollController scrollController = ScrollController();
    scrollController
      ..addListener(() {
        print('${scrollController.offset}');
      });

    List<DropdownMenuItem<String>> sortItems = [];
    String _selectedSort = '排序';
    sortItems.add(DropdownMenuItem(value: '排序', child: Text('排序')));
    sortItems.add(DropdownMenuItem(value: '价格降序', child: Text('价格降序')));
    sortItems.add(DropdownMenuItem(value: '价格升序', child: Text('价格升序')));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // appBar
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0, 4, 50, 4),
                            icon: Icon(Icons.category),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProviderConfig.getInstance()
                                    .getEssayPage();
                              }));
                            }),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '今日事务',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('${selectDate.month}' +
                                '月' +
                                '${selectDate.day}' +
                                '日'),
                          ],
                        ),
                        new PopupMenuButton<String>(
                            padding: EdgeInsets.fromLTRB(50, 4, 0, 4),
                            icon: Icon(Icons.add),
                            onSelected: (String value) {
                              setState(() {
                                print('$value');
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  PopupMenuItem(
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          child: Text("add"),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 4.0),
                                          ),
                                        )
                                      ],
                                    ),
                                    value: '这是增加',
                                  ),
                                  PopupMenuItem(
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        new Text('增加'),
                                        new Icon(Icons.remove_circle)
                                      ],
                                    ),
                                    value: '这是删除',
                                  )
                                ])
                      ],
                    ),
                  ],
                ),
              ),

              // 日历
              calendar,

              // 主体部分
              Expanded(
                  child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // 滚动列表
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          color: Color.fromRGBO(242, 247, 248, 100),
                          height: 2900,
                          child: FutureBuilder(
                            builder: (context, snapshot) {
                              return CustomPaint(
                                painter: LinePainter(snapshot.data, selectDate),
                              );
                            },
                            future: model.getAllAffairs(),
                          ),
                        ),
                      ),
                    ),

                    // 右侧常用事务
                    Container(
                      width: 64,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "常用事务",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),

                            // 常用事务列表
                            Container(
                              child: Flexible(
                                child: FutureBuilder(
                                  // ignore: missing_return
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.done:
                                        print("done");
                                        return ListView(
                                          children: [
                                            ...snapshot.data,
                                          ],
                                        );
                                        break;
                                      case ConnectionState.none:
                                        print("none");
                                        return Text("${snapshot.data}");
                                        break;
                                      case ConnectionState.waiting:
                                        print("wating");
                                        return Text("${snapshot.data}");
                                        break;
                                      case ConnectionState.active:
                                        print("active");
                                        return Text("${snapshot.data}");
                                        break;
                                    }
                                  },
                                  future: model.logic.getCommonAffairs(context),
                                ),
                              ),
                            ),

                            // FloatingActionButton(
                            //   heroTag: "3",
                            //   backgroundColor: Colors.red,
                            //   onPressed: () => model.addCommonAffair(),
                            // ),

                            // 悬浮按钮及文字
                            Container(
                              child: Column(
                                children: [
                                  FloatingActionButton(
                                    child: Icon(Icons.add),
                                    backgroundColor:
                                        Color.fromRGBO(0, 195, 198, 1),
                                    mini: true,
                                    heroTag: "4",
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ProviderConfig.getInstance()
                                            .getNewCommonAffairPage();
                                      })).then((e) {
                                        setState(() {});
                                      });
                                    },
                                  ),
                                  Text(
                                    "新增事务",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 195, 198, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    controller = new CalendarController(
      selectDateModel: DateModel.fromDateTime(DateTime.now()),
      showMode: CalendarConstants.MODE_SHOW_WEEK_AND_MONTH,
      offset: 1,
    )..addOnCalendarSelectListener((dateModel) {
        setState(() {
          selectDate = dateModel;
        });
      });

    calendar = CalendarViewWidget(
      calendarController: controller,
      weekBarItemWidgetBuilder: weekBar,
      dayWidgetBuilder: dayWidget,
    );
    super.initState();
  }
}

// 日历UI
Widget dayWidget(DateModel dateModel) {
  return DefaultCombineDayWidget(dateModel);
}
Widget weekBar() {
  return CustomStyleWeekBarItem();
}
class CustomStyleWeekBarItem extends BaseWeekBar {
  final List<String> weekList = [
    "SUN",
    "MON",
    "TUE",
    "WEN",
    "THU",
    "SUN",
    "SAT"
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List();

    var items = getWeekDayWidget();
    children.add(Row(
      children: items,
    ));

    return Column(
      children: children,
    );
  }

  @override
  Widget getWeekBarItem(int index) {
    return new Container(
      margin: EdgeInsets.only(top: 0, bottom: 0),
      child: new Center(
        child: new Text(
          weekList[index],
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
class DefaultCombineDayWidget extends BaseCombineDayWidget {
  DefaultCombineDayWidget(DateModel dateModel) : super(dateModel);

  @override
  Widget getNormalWidget(DateModel dateModel) {
    //实现默认状态下的UI
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(
        '${dateModel.day}',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget getSelectedWidget(DateModel dateModel) {
    //绘制被选中的UI
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 195, 198, 1),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 2.0),
            )
          ]),
      child: Center(
        child: Text(
          '${dateModel.day}',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}



class LinePainter extends CustomPainter {
  DateModel date;
  List<Affair> allData; // 全部的Affair
  LinePainter(this.allData, this.date);

  List<Affair> todayData = List<Affair>();

  // 提取当天的Affair
  void getTodayAffair() {
    allData.forEach((element) {
      if (element.startTime.day == date.day) {
        todayData.add(element);
      }
    });
  }

  Paint _paint = Paint()..color = Color.fromRGBO(0, 182, 152, 1);

  @override
  void paint(Canvas canvas, Size size) {
    getTodayAffair();
    print("全部affair:$allData");
    print("当天affair:$todayData");

    // 时间轴及左侧时间数字
    for (int i = 1; i < 24; i++) {
      // 左侧时间数字
      TextSpan span = new TextSpan(
          style: new TextStyle(color: Color.fromRGBO(0, 182, 152, 1)),
          text: i.toString());
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(20, i * 120.1));
      // 时间轴横线
      canvas.drawLine(Offset(40, i * 120.1), Offset(400, i * 120.1), _paint);
    }

    // 今日计划
    todayData.forEach((element) {
      // 矩形框背景颜色，类别控制，4种
      switch (element.category) {
        case 1:
          {
            _paint.color = Color.fromRGBO(203, 231, 161, 1);
          }
          break;
        case 2:
          {
            _paint.color = Color.fromRGBO(243, 178, 221, 1);
          }
          break;
        case 3:
          {
            _paint.color = Color.fromRGBO(255, 159, 83, 1);
          }
          break;
        case 4:
          {
            _paint.color = Color.fromRGBO(174, 229, 255, 1);
          }
          break;
      }

      // 开始与结束时间
      int start = element.startTime.hour * 60 + element.startTime.minute;
      int end = element.endTime.hour * 60 + element.endTime.minute;

      // 背景矩形框
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromPoints(Offset(30, start * 2.0), Offset(345, end * 2.0)),
              Radius.circular(10)),
          _paint);

      // 事务名称
      TextSpan name = new TextSpan(
          style: new TextStyle(color: Colors.black), text: element.name);
      TextPainter tp1 = new TextPainter(
          text: name,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp1.layout();
      tp1.paint(canvas, Offset(150, (start + end) * 0.99));

      // 图标背景
      _paint..color = Color(element.color);
      canvas.drawCircle(Offset(55.0, (start + end) * 0.9999), 20.0, _paint);

      // 事务图标
      TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
      textPainter.text = TextSpan(text: String.fromCharCode(element.icon),
          style: TextStyle(fontSize: 17.0,fontFamily: 'MyFlutterApp', color: Colors.black));
      textPainter.layout();
      textPainter.paint(canvas, Offset(50.0, (start + end) * 0.99));
    });

    // final icon = Icons.category;
    // var builder = ParagraphBuilder(ParagraphStyle(
    //   fontFamily: icon.fontFamily,
    // ))..addText(String.fromCharCode(icon.codePoint));
    // var para = builder.build();
    // para.layout(const ParagraphConstraints(width: 500));
    // canvas.drawParagraph(para, const Offset(50.0, 200.0));




    ParagraphBuilder pb2 = ParagraphBuilder(ParagraphStyle(
      textAlign: TextAlign.left,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ));
    pb2.addText('学习');
    ParagraphConstraints pc = ParagraphConstraints(width: 300);
    Paragraph paragraph = pb2.build()..layout(pc);
    // canvas.drawParagraph(paragraph, Offset(40.0, 40.0));

    // for(int i = 0; i < todayData.length; i++){
    //
    // }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
