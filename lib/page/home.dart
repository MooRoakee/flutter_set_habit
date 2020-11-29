import 'package:flutter/material.dart';
import 'package:set_habit/others/constant.dart';

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

bool isDrawerOpen = false;
bool isGesture = false;

class _MyAppState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleOffset = 1;
  double rotateOffset = 0;
  double profileXOffset = 0;
  double profileRotate = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(Object context) {
    var width = MediaQuery.of(context).size.width; //返回context所在的窗口宽度
    var height = MediaQuery.of(context).size.height; //返回context所在的窗口高度

    int i = 0;
    while (i < 3) {
      i++;
      habit.add(buildHabit(
        Color.fromRGBO(255, 234, 233, 1),
        Color.fromRGBO(255, 0, 0, 1),
        Color.fromRGBO(255, 148, 147, 1),
        'Bill Pay',
        'Due on May 14th',
        Icons.create_sharp,
      ));
      habit.add(buildHabit(
          Color.fromRGBO(237, 228, 255, 1),
          Color.fromRGBO(114, 48, 222, 1),
          Color.fromRGBO(180, 145, 240, 1),
          'ReWards',
          '12,324 points',
          Icons.insert_chart));

      habit.add(buildHabit(
          Color.fromRGBO(227, 255, 239, 1),
          Color.fromRGBO(63, 210, 140, 1),
          Color.fromRGBO(164, 209, 186, 1),
          'Statement',
          'June 2020 Available',
          Icons.insert_chart));
    }
    return SafeArea(
        child: AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleOffset)
        ..rotateZ(rotateOffset),
      duration:
          isGesture ? Duration(milliseconds: 0) : Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDrawerOpen || isGesture
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0)),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails d) {
          print('dx = ${d.delta.dx} dy = ${d.delta.dy}');

          isGesture = true;
          if (!isDrawerOpen) {
            if (d.delta.dx > 0) {
              if (xOffset <= 290) xOffset += d.delta.dx;
              if (yOffset <= 80) yOffset += d.delta.dy;
              if (scaleOffset >= 0.85) scaleOffset *= 0.999;
              if (rotateOffset <= 0.25 && rotateOffset >= 0)
                rotateOffset += 0.002;
              if (profileRotate <= 0.25 && profileRotate >= 0)
                profileRotate += 0.009;
              if (profileXOffset <= 10) profileXOffset += 0.2;
            } else {
              if (xOffset >= 20) {
                if (xOffset <= 290) xOffset += d.delta.dx;
                if (yOffset <= 80) yOffset += d.delta.dy;
                if (scaleOffset >= 0.85) scaleOffset *= 1.001;
                if (rotateOffset <= 0.25 && rotateOffset >= 0)
                  rotateOffset -= 0.0005;
                if (profileRotate <= 0.25 && profileRotate >= 0)
                  profileRotate -= 0.009;
                if (profileXOffset <= 10) profileXOffset -= 0.2;
              }
            }
          } else {
            if (xOffset <= 290) xOffset += d.delta.dx;
            if (yOffset >= 0) yOffset += d.delta.dx;
            if (scaleOffset >= 0.85) scaleOffset *= 1.001;
            if (rotateOffset <= 0) rotateOffset -= 0.001;
            if (profileRotate <= 0.25 && profileRotate >= 0)
              profileRotate += 0.009;
            if (profileXOffset <= 10) profileXOffset += 0.2;
          }

          setState(() {});
        },
        onPanEnd: (d) {
          if (!isDrawerOpen) {
            if (xOffset >= 290 / 2) {
              isDrawerOpen = !isDrawerOpen;
              xOffset = isDrawerOpen ? 290 : 0;
              yOffset = isDrawerOpen ? 80 : 0;
              profileXOffset = isDrawerOpen ? 35 : 0;
              scaleOffset = isDrawerOpen ? 0.85 : 1;
              rotateOffset = isDrawerOpen ? -50 : 0;
              profileRotate = isDrawerOpen ? -150 : 0;
            } else {
              xOffset = isDrawerOpen ? 290 : 0;
              yOffset = isDrawerOpen ? 80 : 0;
              profileXOffset = isDrawerOpen ? 35 : 0;
              scaleOffset = isDrawerOpen ? 0.85 : 1;
              rotateOffset = isDrawerOpen ? -50 : 0;
              profileRotate = isDrawerOpen ? -150 : 0;
            }
          } else {
            if (xOffset <= 290 / 2) {
              isDrawerOpen = !isDrawerOpen;
              xOffset = isDrawerOpen ? 290 : 0;
              yOffset = isDrawerOpen ? 80 : 0;
              profileXOffset = isDrawerOpen ? 35 : 0;
              scaleOffset = isDrawerOpen ? 0.85 : 1;
              rotateOffset = isDrawerOpen ? -50 : 0;
              profileRotate = isDrawerOpen ? -150 : 0;
            } else {
              xOffset = isDrawerOpen ? 290 : 0;
              yOffset = isDrawerOpen ? 80 : 0;
              profileXOffset = isDrawerOpen ? 35 : 0;
              scaleOffset = isDrawerOpen ? 0.85 : 1;
              rotateOffset = isDrawerOpen ? -50 : 0;
              profileRotate = isDrawerOpen ? -150 : 0;
            }
          }

          isGesture = false;
          setState(() {});
        },
        child: Column(
          children: <Widget>[
            ///====================================
            ///头像
            ///====================================
            GestureDetector(
              onTap: () {
                setState(() {
                  isDrawerOpen = !isDrawerOpen;
                  xOffset = isDrawerOpen ? 290 : 0;
                  yOffset = isDrawerOpen ? 80 : 0;
                  profileXOffset = isDrawerOpen ? 35 : 0;
                  scaleOffset = isDrawerOpen ? 0.85 : 1;
                  rotateOffset = isDrawerOpen ? -50 : 0;
                  profileRotate = isDrawerOpen ? -150 : 0;
                });
              },
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, top: height * 0.02),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    transform: Matrix4.translationValues(profileXOffset, 0, 0)
                      ..rotateZ(profileRotate),
                    curve: Curves.fastOutSlowIn,
                    duration: isGesture
                        ? Duration(milliseconds: 0)
                        : Duration(milliseconds: 200),
                    child: CircleAvatar(
                      radius: width * 0.07,
                      backgroundImage: AssetImage('assets/img/profile.png'),
                    ),
                  ),
                ),
              ),
            ),

            ///====================================
            ///客套话
            ///====================================
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, top: height * 0.025),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi, MioRoakee',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, top: height * 0.005),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What do you want to do today?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),

            ///======================================
            ///没啥用的东西
            ///======================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.03, left: width * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$12,939.25',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.03, right: width * 0.07),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$100,203.32',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.05, top: height * 0.01),
                    child: Text(
                      'Checking Account',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.20, top: height * 0.01),
                    child: Text(
                      'Savings Account',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, top: height * 0.007),
                    child: Text(
                      'Balance',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.34, top: height * 0.007),
                    child: Text(
                      'Balance',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
              ],
            ),
            Container(
              height: height * 0.648,
              child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(width * 0.05),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: .9,
                  children: habit),
            ),
          ],
        ),
      ),
    ));
  }
}
