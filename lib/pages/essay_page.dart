/**
 * Created by luhai on 2020/7/20
 * 随笔页面
 */
import 'package:flutter/material.dart';

class EssayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
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
                  width: 100,
                  height: 100,
                  child: Text("a"),
                ),
              ),

            ],
          ),

        ),
      ),
    );

  }
}
