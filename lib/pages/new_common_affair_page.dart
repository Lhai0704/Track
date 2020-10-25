import 'dart:ui';

/// Created by luhai on 2020/8/25
/// 新建常用事务

import "package:flutter/material.dart";
import 'package:track/dao/tables_dao.dart';
import 'package:track/model/global_model.dart';
import 'package:track/model/main_page_model.dart';
import 'package:track/model/new_common_affair_page_model.dart';
import 'package:track/widgets/myExpansionTile.dart';
import 'package:track/widgets/painter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class NewCommonAffairPage extends StatefulWidget {
  NewCommonAffairPage({Key key}) : super(key: key);

  @override
  _NewCommonAffairPageState createState() => new _NewCommonAffairPageState();
}

class _NewCommonAffairPageState extends State<NewCommonAffairPage> {
  // 顶部标签
  final List<Tab> tabs = <Tab>[
    new Tab(
      text: "新建事务",
    ),
    new Tab(
      text: "事务仓库",
    ),
  ];

  List<Widget> listWidgets = List<Widget>();

  // 选择图标的数据
  List<Widget> _getIconData(context) {
    List<Widget> data = List<Widget>();
    for (int i = 0xe800; i < 0xe90e; i++) {
      data.add(Container(
        child: ChoiceChip(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          selectedShadowColor: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // padding: EdgeInsets.all(10.0),
          backgroundColor: Colors.white,
          label: Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Icon(
              IconData(i, fontFamily: 'MyFlutterApp'),
              color: Colors.black,
              size: 22,
            ),
          ),

          selected: _selectedIcon == i,
          onSelected: (bool selected) {
            setState(() {
              _selectedIcon = i;
            });
          },
        ),
      ));
    }
    return data;
  }

  // 选择颜色
  List<Widget> _getColorData(context) {
    List<Widget> data = List<Widget>();
    _colors.forEach((element) {
      data.add(Container(
        height: 70,
        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
        // decoration: BoxDecoration(
        //   color: Color(int.parse(element, radix: 16) | 0xFF000000),
        // ),
        child: ChoiceChip(
          backgroundColor: Color(int.parse(element, radix: 16) | 0xFF000000),
          label: Container(),
          selected:
              _selectedColor == int.parse(element, radix: 16) | 0xFF000000,
          onSelected: (bool selected) {
            setState(() {
              _selectedColor = int.parse(element, radix: 16) | 0xFF000000;
            });
          },
        ),
      ));
    });
    return data;
  }

  // 中心图标
  Widget mainIcon() {
    // 未选择
    if (_selectedIcon == 0) {
      return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      );
    } else {
      return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Color(_selectedColor),
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          IconData(_selectedIcon, fontFamily: 'MyFlutterApp'),
          color: Colors.black,
        ),
      );
    }
  }

  final TextEditingController _controller1 = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  final width = window.physicalSize.width / window.devicePixelRatio;

  int _selectedType = 0; // 事务类型
  int _selectedIcon = 0; // 选择图标
  int _selectedColor = 0; // 选择颜色
  bool _switchSelected = true; // 是否为全天事件
  String name = ''; // 事务名称
  String remark = ''; // 备注
  List<String> _colors = [
    "FFFFFF",
    "FF6176",
    "FFE059",
    "000000",
    "F2F7F7",
    "B3B3B3",
    "C1E3E5",
    "DAF5FE",
    "FF9F53",
    "FFEB8E",
    "E96CA8",
    "E5FAF7",
    "B8E272",
    "FF9A93",
    "FBC48F",
    "00B698",
    "AEE5FF",
    "D6547A",
    "F7A779",
    "FC88A7",
    "F3B2DD",
    "D1A0F9",
    "C5BEE6",
    "EAD3CD",
    "E4A598",
    "68CAF5",
    "78DCDA",
    "00C3C6",
    "CBE7A1",
    "165760"
  ];

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewCommonAffairPageModel>(context);
    final globalModel = Provider.of<GlobalModel>(context);
    model.setContext(context, globalModel: globalModel);
    globalModel.setNewCommonAffairPageModel(model);
    final statusHeight = window.padding.top / window.devicePixelRatio;

    _controller1.addListener(() {
      name = _controller1.text;
    });
    _controller2.addListener(() {
      remark = _controller2.text;
    });

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: Container(
        child: DefaultTabController(
          length: 2,
          child: Container(
            child: Stack(
              children: [
                TabBarView(children: [
                  // 自定义事务
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        color: Color.fromRGBO(0xf2, 0xf7, 0xf7, 1),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                reverse: false,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 220,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '选择图标：',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Container(
                                            height: 180,
                                            child: GridView(
                                              scrollDirection:
                                              Axis.horizontal,
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio:
                                                  1.0),
                                              children:
                                              _getIconData(context),
                                            ),
                                          ),
                                          Text(
                                            '选择底色：',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Container(
                                            height: 120,
                                            child: GridView(
                                              scrollDirection:
                                              Axis.horizontal,
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 1.0,
                                              ),
                                              children:
                                              _getColorData(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // 事务名称
                                    Container(
                                      height: 80,
                                      padding: EdgeInsets.only(top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: new Border.all(
                                              color: Color.fromRGBO(
                                                  22, 87, 96, 1),
                                              width: 2.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        40, 20, 0, 20),
                                                    child: Text(
                                                      "事务名称",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        20, 10, 50, 10),
                                                    child: TextField(
                                                      maxLength: 4,
                                                      controller: _controller1,
                                                      decoration:
                                                      new InputDecoration(
                                                        hintText: '',
                                                        // contentPadding: EdgeInsets.only(right: 100),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),

                                    // 事务类型
                                    Container(
                                      // flex: 1,
                                      height: 80,
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0, 16, 0, 0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: new Border.all(
                                              color: Colors.black,
                                              width: 2.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        40, 10, 0, 10),
                                                    child: Text(
                                                      "事务类型",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      ChoiceChip(
                                                          selectedColor:
                                                          Color.fromRGBO(0,
                                                              182, 152, 1),
                                                          backgroundColor:
                                                          Color.fromRGBO(
                                                              242,
                                                              247,
                                                              247,
                                                              1),
                                                          selected:
                                                          _selectedType ==
                                                              1,
                                                          label: Text(
                                                            '学习',
                                                            style: TextStyle(
                                                                color: _selectedType == 1
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black),
                                                          ),
                                                          onSelected:
                                                              (bool selected) {
                                                            setState(() {
                                                              _selectedType = 1;
                                                            });
                                                          }),
                                                      ChoiceChip(
                                                          selectedColor:
                                                          Color.fromRGBO(0,
                                                              182, 152, 1),
                                                          backgroundColor:
                                                          Color.fromRGBO(
                                                              242,
                                                              247,
                                                              247,
                                                              1),
                                                          selected:
                                                          _selectedType ==
                                                              2,
                                                          label: Text(
                                                            '工作',
                                                            style: TextStyle(
                                                                color: _selectedType == 2
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black),
                                                          ),
                                                          onSelected:
                                                              (bool selected) {
                                                            setState(() {
                                                              _selectedType = 2;
                                                            });
                                                          }),
                                                      ChoiceChip(
                                                          selectedColor:
                                                          Color.fromRGBO(0,
                                                              182, 152, 1),
                                                          backgroundColor:
                                                          Color.fromRGBO(
                                                              242,
                                                              247,
                                                              247,
                                                              1),
                                                          selected:
                                                          _selectedType ==
                                                              3,
                                                          label: Text(
                                                            '生活',
                                                            style: TextStyle(
                                                                color: _selectedType == 3
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black),
                                                          ),
                                                          onSelected:
                                                              (bool selected) {
                                                            setState(() {
                                                              _selectedType = 3;
                                                            });
                                                          }),
                                                      ChoiceChip(
                                                          selectedColor:
                                                          Color.fromRGBO(0,
                                                              182, 152, 1),
                                                          backgroundColor:
                                                          Color.fromRGBO(
                                                              242,
                                                              247,
                                                              247,
                                                              1),
                                                          selected:
                                                          _selectedType ==
                                                              4,
                                                          label: Text(
                                                            '娱乐',
                                                            style: TextStyle(
                                                                color: _selectedType == 4
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black),
                                                          ),
                                                          onSelected:
                                                              (bool selected) {
                                                            setState(() {
                                                              _selectedType = 4;
                                                            });
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),

                                    // 备注
                                    Container(
                                      // flex: 2,
                                      height: 150,
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0, 16, 0, 0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: new Border.all(
                                              color: Colors.black,
                                              width: 2.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Container(
                                                        margin:
                                                        EdgeInsets.fromLTRB(
                                                            30, 2, 0, 2),
                                                        child: Text(
                                                          "备注",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                        EdgeInsets.fromLTRB(
                                                            20, 0, 20, 0),
                                                        child: Padding(
                                                          // padding: EdgeInsets
                                                          //     .only(
                                                          //   bottom: MediaQuery
                                                          //       .of(
                                                          //       context)
                                                          //       .viewInsets
                                                          //       .bottom,
                                                          // ),
                                                          padding:
                                                          EdgeInsets.zero,
                                                          child: TextField(
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                            maxLength: 40,
                                                            maxLines: 2,
                                                            controller:
                                                            _controller2,
                                                            decoration:
                                                            new InputDecoration(
                                                              fillColor: Color
                                                                  .fromRGBO(
                                                                  242,
                                                                  247,
                                                                  247,
                                                                  1),
                                                              filled: true,
                                                              hintText: '',
                                                              focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.all(Radius.circular(
                                                                      16.0)),
                                                                  borderSide:
                                                                  BorderSide(
                                                                    width:
                                                                    1.0,
                                                                  )),
                                                              enabledBorder:
                                                              OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                    .circular(
                                                                    16.0)),
                                                                borderSide:
                                                                BorderSide(
                                                                    width:
                                                                    1.0),
                                                              ),
                                                              // border: OutlineInputBorder(
                                                              //   borderRadius: BorderRadius.all(Radius.circular(16.0))
                                                              // ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),

                                    // 完成和取消按钮
                                    Container(
                                      padding:
                                      EdgeInsets.fromLTRB(0, 20, 0, 20),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FlatButton(
                                            minWidth: 150.0,
                                            color: Color.fromRGBO(
                                                0, 195, 198, 1),
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10.0)),
                                            child: Text("完成"),
                                            onPressed: () {
                                              CommonAffair commonAffair =
                                              CommonAffair(
                                                  id: null,
                                                  icon: _selectedIcon,
                                                  color: _selectedColor,
                                                  name: name,
                                                  category:
                                                  _selectedType,
                                                  remark: remark);
                                              model.insertAffair(
                                                  commonAffair);
                                              print("添加：${commonAffair}");
                                              Navigator.pop(context);
                                            },
                                          ),
                                          FlatButton(
                                            minWidth: 150.0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10.0)),
                                            color: Color.fromRGBO(
                                                22, 87, 96, 1),
                                            textColor: Colors.white,
                                            child: Text("取消"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
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
                      ),
                      Stack(
                        children: [
                          CustomPaint(
                            painter: Painter(),
                          ),
                          Column(
                            children: [
                              // 中心图标
                              Container(
                                padding: EdgeInsets.fromLTRB(width / 2 - 25, 90 + statusHeight, 0, 0),
                                child: mainIcon(),
                              ),

                              // 图标下面横线
                              Container(
                                width: 50,
                                margin: EdgeInsets.fromLTRB(width / 2 - 25, 10, 0, 0),
                                color: Color.fromRGBO(112, 112, 112, 1),
                                height: 1,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),

                  // 事务仓库
                  Container(
                    child: Container(
                      color: Color.fromRGBO(0, 195, 198, 1),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                              ),

                              // 事务仓库1 生活
                              MyExpansionTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    border: new Border.all(
                                        color: Colors.black, width: 2.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(203, 231, 161, 1),
                                    image: DecorationImage(
                                      image: AssetImage('assets/事务仓库1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 120,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "生活",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "LIVING",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/star.png',
                                              height: 20,
                                            ),
                                            FutureBuilder(
                                              // ignore: missing_return
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                switch (snapshot
                                                    .connectionState) {
                                                  case ConnectionState.done:
                                                    print("done");
                                                    return Text(
                                                        '${snapshot.data.length}');
                                                    break;
                                                  case ConnectionState.none:
                                                    print("none");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                  case ConnectionState
                                                      .waiting:
                                                    print("wating");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                  case ConnectionState.active:
                                                    print("active");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                }
                                              },
                                              future: model.getAllAffairs(),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                children: [
                                  Container(
                                    height: 200,
                                    margin: EdgeInsets.fromLTRB(14, 0, 12, 0),
                                    padding:
                                    EdgeInsets.fromLTRB(10, 8, 10, 0),
                                    decoration: BoxDecoration(
                                      border: new Border.all(
                                          color: Colors.black, width: 1.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Color.fromRGBO(242, 247, 247, 1),
                                    ),
                                    child: Container(
                                        child: FutureBuilder(
                                          // ignore: missing_return
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            switch (snapshot.connectionState) {
                                              case ConnectionState.done:
                                                print("done");
                                                return GridView(
                                                  scrollDirection:
                                                  Axis.horizontal,
                                                  gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    childAspectRatio: 1.0,
                                                  ),
                                                  children: snapshot.data,
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
                                          future:
                                          model.getAffairsWidgetList(context),
                                        )),
                                  )
                                ],
                              ),

                              // 事务仓库2 娱乐
                              MyExpansionTile(
                                title: Container(
                                  // margin: EdgeInsets.fromLTRB(
                                  //     0, 16, 0, 0),
                                  decoration: BoxDecoration(
                                    border: new Border.all(
                                        color: Colors.black, width: 2.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(255, 159, 83, 1),
                                    image: DecorationImage(
                                      image: AssetImage('assets/事务仓库2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 120,
                                  // width: 700,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "娱乐",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "ENTERTAIN",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/star.png',
                                              height: 20,
                                            ),
                                            Text('${model.affairs.length}'),
                                            FutureBuilder(
                                              // ignore: missing_return
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                switch (snapshot
                                                    .connectionState) {
                                                  case ConnectionState.done:
                                                    print("done");
                                                    return Text(
                                                        '${snapshot.data.length}');
                                                    break;
                                                  case ConnectionState.none:
                                                    print("none");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                  case ConnectionState
                                                      .waiting:
                                                    print("wating");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                  case ConnectionState.active:
                                                    print("active");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                }
                                              },
                                              future: model.getAllAffairs(),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: new Border.all(
                                          color: Colors.black, width: 2.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Color.fromRGBO(242, 247, 247, 1),
                                    ),
                                    // child: GridView(
                                    //
                                    // ),
                                  )
                                ],
                              ),
                              MyExpansionTile(
                                title: Container(
                                  // margin: EdgeInsets.fromLTRB(
                                  //     0, 16, 0, 0),
                                  decoration: BoxDecoration(
                                    border: new Border.all(
                                        color: Colors.black, width: 2.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(243, 178, 221, 1),
                                    image: DecorationImage(
                                      image: AssetImage('assets/事务仓库3.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 120,
                                  // width: 700,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "学习",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "STUDY",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/star.png',
                                              height: 20,
                                            ),
                                            FutureBuilder(
                                              // ignore: missing_return
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                switch (snapshot
                                                    .connectionState) {
                                                  case ConnectionState.done:
                                                    print("done");
                                                    return Text(
                                                        '${snapshot.data.length}');
                                                    break;
                                                  case ConnectionState.none:
                                                    print("none");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                  case ConnectionState
                                                      .waiting:
                                                    print("wating");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                  case ConnectionState.active:
                                                    print("active");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                }
                                              },
                                              future: model.getAllAffairs(),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: new Border.all(
                                          color: Colors.black, width: 2.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Color.fromRGBO(242, 247, 247, 1),
                                    ),
                                    // child: GridView(
                                    //
                                    // ),
                                  )
                                ],
                              ),
                              MyExpansionTile(
                                // trailing: Container(
                                //   height: .1,
                                //   width: .1,
                                // ),
                                title: Container(
                                  // margin: EdgeInsets.fromLTRB(
                                  //     0, 16, 0, 0),
                                  decoration: BoxDecoration(
                                    border: new Border.all(
                                        color: Colors.black, width: 2.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(174, 229, 255, 1),
                                    image: DecorationImage(
                                      image: AssetImage('assets/事务仓库4.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 120,
                                  // width: 700,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "工作",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "WORK",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/star.png',
                                              height: 20,
                                            ),
                                            FutureBuilder(
                                              // ignore: missing_return
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                switch (snapshot
                                                    .connectionState) {
                                                  case ConnectionState.done:
                                                    print("done");
                                                    return Text(
                                                        '${snapshot.data.length}');
                                                    break;
                                                  case ConnectionState.none:
                                                    print("none");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                  case ConnectionState
                                                      .waiting:
                                                    print("wating");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                  case ConnectionState.active:
                                                    print("active");
                                                    return Text(
                                                        "${snapshot.data}");
                                                    break;
                                                }
                                              },
                                              future: model.getAllAffairs(),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: new Border.all(
                                          color: Colors.black, width: 2.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Color.fromRGBO(242, 247, 247, 1),
                                    ),
                                    // child: GridView(
                                    //
                                    // ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                // 标题appbar
                Container(
                  padding: EdgeInsets.fromLTRB(0, statusHeight, 0, 0),
                  color: Color.fromRGBO(0, 195, 198, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 40, 0),
                        width: 300,
                        child: TabBar(
                          labelPadding: EdgeInsets.zero,
                          indicatorColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 15),
                          unselectedLabelColor: Colors.yellow,
                          unselectedLabelStyle: TextStyle(fontSize: 14),
                          tabs: [
                            Tab(
                              text: "自定义事务",
                            ),
                            Tab(text: "事务仓库"),
                          ],
                        ),
                      ),
                    ],
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
