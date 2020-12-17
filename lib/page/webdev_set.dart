import 'package:flutter/material.dart';

class webdev_setting extends StatefulWidget {
  @override
  _webdev_settingState createState() => _webdev_settingState();
}

class _webdev_settingState extends State<webdev_setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Webdev 配置页"),
        ),
        body: Center(
            child: Icon(
          Icons.cloud,
          size: 100,
        )));
  }
}
