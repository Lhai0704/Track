/**
 * Created by luhai on 2020/9/15
 */

import 'package:flutter/material.dart';

class StorageMain extends StatefulWidget {
  @override
  _StorageMainState createState() => _StorageMainState();
}

class _StorageMainState extends State<StorageMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        children: [
          Expanded(
              child: ListView.builder(itemBuilder: null)
          ),
        ],
      ),
    );
  }
}
