import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:set_habit/others/constant.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var width;
  var height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width; //返回context所在的窗口宽度
    height = MediaQuery.of(context).size.height; //返回context所在的窗口高度
    return SafeArea(
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 30, bottom: 70),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: width * 0.07,
                      child: FlutterLogo(),
                      // backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'atdadfafa',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
