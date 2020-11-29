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
          color: Colors.grey,
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
                  height: height * 0.15,
                ),
                Column(
                  children: [
                    InkWell(
                      child: NewRoute(
                        key: UniqueKey(),
                        text: 'Webdev',
                        icon: Icons.cloud,
                      ),
                      onTap: () {
                        Get.to(webdev_setting(), transition: Transition.size);
                      },
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    NewRoute(
                      text: 'Settings',
                      icon: Icons.settings,
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    NewRoute(
                      text: 'Settings',
                      icon: Icons.settings,
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    NewRoute(
                      text: 'Settings',
                      icon: Icons.settings,
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class NewRoute extends StatelessWidget {
  final IconData icon;
  final String text;
  const NewRoute({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
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
