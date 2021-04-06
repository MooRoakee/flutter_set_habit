import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:set_habit/page/webdev_set.dart';

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
          color: Color.fromRGBO(163, 162, 177, 1),
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 30, bottom: 70),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: width * 0.07,
                      child: FlutterLogo(),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Set Habits!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        OpenContainer(
                          closedColor: Color.fromRGBO(163, 162, 177, 1),
                          closedElevation: 0,
                          openElevation: 0,
                          transitionDuration: Duration(milliseconds: 450),
                          transitionType: ContainerTransitionType.fadeThrough,
                          closedBuilder: (ctx, action) => DrawerItem(
                            text: 'Webdev',
                            icon: Icons.cloud,
                          ),
                          openBuilder: (ctx, action) => webdev_setting(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        DrawerItem(
                          text: 'Settings',
                          icon: Icons.settings,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      color: Color.fromRGBO(163, 162, 177, 1),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const DrawerItem({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ],
    );
  }
}
