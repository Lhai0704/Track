import 'dart:ui';

/**
 * Created by luhai on 2020/8/25
 */

import "package:flutter/material.dart";
import 'package:track/config/provider_config.dart';
import 'package:track/dao/tables_dao.dart';
import 'package:track/model/global_model.dart';
import 'package:track/model/new_affair_page_model.dart';
import 'package:track/widgets/painter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class NewAffairPage extends StatefulWidget {
  NewAffairPage({Key key, this.icon, this.color}) : super(key: key);
  int icon;
  int color;

  @override
  _NewAffairPageState createState() => new _NewAffairPageState();
}

class _NewAffairPageState extends State<NewAffairPage> {
  final TextEditingController _controller1 = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  int _selected = 0; // 事务类型
  bool _switchSelected = true; // 是否为全天事件
  String name = ''; // 事务名称
  String remark = ''; // 备注

  DateTime startTime = DateTime.now(); // 开始时间
  DateTime endTime = DateTime.now(); // 结束时间

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewAffairPageModel>(context);
    final globalModel = Provider.of<GlobalModel>(context);
    model.setContext(context, globalModel: globalModel);
    globalModel.setNewAffairPageModel(model);

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
      backgroundColor: Color.fromRGBO(0xf2, 0xf7, 0xf7, 1),
      body: Container(
          child: Stack(
        children: [
          SingleChildScrollView(
            reverse: false,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: 220,
                  ),

                  // 事务名称
                  Container(
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(
                            color: Color.fromRGBO(22, 87, 96, 1), width: 2.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(40, 10, 0, 10),
                              child: Text(
                                "事务名称",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 50, 10),
                              child: TextField(
                                maxLengthEnforced: false,
                                maxLength: 4,
                                controller: _controller1,
                                decoration: new InputDecoration(
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

                  // 事务时间
                  Container(
                    // flex: 2,
                    height: 160,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(color: Colors.black, width: 2.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(40, 10, 0, 10),
                              child: Text(
                                "事务时间",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  MaterialButton(
                                    child: Text("${startTime.hour}" +
                                        ":" +
                                        "${startTime.minute}"),
                                    onPressed: () {
                                      DatePicker.showTimePicker(context,
                                          onChanged: (date) {
                                        setState(() {
                                          startTime = date;
                                        });
                                      });
                                      // onConfirm: (date) {
                                      //   startTime = date;
                                      // });
                                    },
                                  ),
                                  Text("  -  "),
                                  MaterialButton(
                                    child: Text("${endTime.hour}" +
                                        ":" +
                                        "${endTime.minute}"),
                                    onPressed: () {
                                      DatePicker.showTimePicker(context,
                                          onChanged: (date) {
                                        setState(() {
                                          endTime = date;
                                        });
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("全天事务"),
                                  Switch(
                                    value: _switchSelected,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      setState(() {
                                        _switchSelected = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                    ),
                  ),

                  // 事务类型
                  Container(
                    // flex: 1,
                    height: 80,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(color: Colors.black, width: 2.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(40, 10, 0, 10),
                              child: Text(
                                "事务类型",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Wrap(
                              children: [
                                ChoiceChip(
                                    selected: _selected == 1,
                                    label: Text('学习'),
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _selected = 1;
                                      });
                                    }),
                                ChoiceChip(
                                    selected: _selected == 2,
                                    label: Text('工作'),
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _selected = 2;
                                      });
                                    }),
                                ChoiceChip(
                                    selected: _selected == 3,
                                    label: Text('生活'),
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _selected = 3;
                                      });
                                    }),
                                ChoiceChip(
                                    selected: _selected == 4,
                                    label: Text('娱乐'),
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _selected = 4;
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
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(color: Colors.black, width: 2.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 2, 0, 2),
                                  child: Text(
                                    "备注",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: TextField(
                                      style: TextStyle(fontSize: 16),
                                      maxLength: 40,
                                      maxLines: 2,
                                      controller: _controller2,
                                      textInputAction: TextInputAction.done,
                                      decoration: new InputDecoration(
                                        fillColor: Colors.black54,
                                        filled: true,
                                        hintText: '',
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16.0)),
                                            borderSide: BorderSide(
                                              width: 1.0,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16.0)),
                                          borderSide: BorderSide(width: 1.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("完成"),
                        onPressed: () {
                          Affair affair = Affair(
                              id: null,
                              icon: widget.icon,
                              color: widget.color,
                              name: name,
                              startTime: startTime,
                              endTime: endTime,
                              category: _selected,
                              remark: remark,
                              checked: model.toInt(_switchSelected));
                          model.insertAffair(affair);
                        },
                      ),
                      MaterialButton(
                        color: Colors.black54,
                        textColor: Colors.white,
                        child: Text("取消"),
                        onPressed: () {
                          // showModalBottomSheet(
                          //     context: context,
                          //     isScrollControlled: true,
                          //     builder: (BuildContext context) {
                          //       return SingleChildScrollView(
                          //           child: Container(
                          //             padding:
                          //             EdgeInsets.only(
                          //                 bottom: MediaQuery
                          //                     .of(context)
                          //                     .viewInsets
                          //                     .bottom),
                          //             child: Container(color: Colors.red,height: 120,),
                          //           )
                          //       );
                          //     });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          CustomPaint(
            painter: Painter(),
          ),

          // appBar
          Container(
            padding: EdgeInsets.fromLTRB(0, statusHeight, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    padding: EdgeInsets.fromLTRB(32, 4, 100, 4),
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '新建事务',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text('10月10日'),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
