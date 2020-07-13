/**
 * Created by luhai on 2020/7/13
 */

import 'package:flutter/material.dart';
import 'right_affairs.dart';

class WorkSpace extends StatefulWidget {
  @override
  _WorkSpaceState createState() => _WorkSpaceState();
}

class _WorkSpaceState extends State<WorkSpace> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(),
        Expanded(
          child: RightAffairs(),
        ),
      ],
    );
  }
}
