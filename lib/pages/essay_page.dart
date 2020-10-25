import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

/**
 * Created by luhai on 2020/7/20
 * 随笔页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:track/config/provider_config.dart';
import 'package:track/dao/tables_dao.dart';
import 'package:track/model/essay_page_model.dart';
import 'package:track/model/global_model.dart';
import 'package:track/util/aspectRatioImage.dart';

class EssayPage extends StatefulWidget {
  @override
  _EssayPageState createState() => _EssayPageState();
}

class _EssayPageState extends State<EssayPage> {
  @override
  Widget build(BuildContext context) {
    final width = window.physicalSize.width / window.devicePixelRatio;
    final height = window.physicalSize.height / window.devicePixelRatio;
    final model = Provider.of<EssayPageModel>(context);
    final globalModel = Provider.of<GlobalModel>(context);
    model.setContext(context, globalModel: globalModel);

    Future<List<Essay>> getAllEssays() async {
      print("获取所有随笔");
      List<Essay> a = new List<Essay>();
      a = await globalModel.database.getAllEssays();
      return a;
    }

    Future<List<Widget>> getEssays(context) async {
      print("开始getEssays");
      int i;
      List<Essay> essays = new List<Essay>();
      await getAllEssays().then((value) {
        print('这是Essays：${value}');
        i = value.length;
        essays.addAll(value);
      });

      return List.generate(i, (index) {
        final a = essays[index];
        Uint8List _bytesImage = Base64Decoder().convert(a.picture);

        return Container(
          width: width / 3,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: new Border.all(color: Colors.black, width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ClipRRect(
                  child: Image.memory(
                    _bytesImage,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Text('${a.title}'),
              Text('${a.time.toString()}')
            ],
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 247, 247, 1),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () => Navigator.pop(context),),
        title: Container(
          child: Text(
            "随笔",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                child: FutureBuilder(
                  future: getAllEssays(),
                  // ignore: missing_return
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return StaggeredGridView.countBuilder(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                        crossAxisCount: 4,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          print("开始getEssays");
                          final a = snapshot.data[index];
                          Uint8List _bytesImage =
                              Base64Decoder().convert(a.picture);

                          return Container(
                            width: width / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(2.0),
                                  margin: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: new Border.all(
                                        color: Colors.black, width: 1.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: ClipRRect(
                                    child: Image.memory(_bytesImage, fit: BoxFit.cover,),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(16,6,0,0),
                                  child: Text('${a.title}', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(16,0,0,0),
                                  child: Text('${a.time.month}' + '月' + '${a.time.day}' + '日', style: TextStyle(color: Color.fromRGBO(179, 179, 179, 1), fontSize: 14),),
                                ),
                              ],
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      );
                    }
                  },
                ),
              ),
              // Positioned(
              //   bottom: height / 5,
              //   right: width / 2,
              //   child: ,
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Color.fromRGBO(0, 195, 198, 1),
          onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ProviderConfig.getInstance().getNewEssayPage();
          }),
        ).then((value) {
          setState(() {});
        });
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
