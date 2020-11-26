import 'package:flutter/material.dart';
import 'package:set_habit/others/constant.dart';

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  double profileXOffset = 0;
  bool isDrawerOpen = false;

  @override
  void initState() {
    // habit.add(Habit(HabitSet(Colors.amber)));
    super.initState();
  }

  @override
  Widget build(Object context) {
    var width = MediaQuery.of(context).size.width; //返回context所在的窗口宽度
    var height = MediaQuery.of(context).size.height; //返回context所在的窗口高度
    var heightScaleOfHead = 0.345;

    return SafeArea(
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: isDrawerOpen
                ? BorderRadius.circular(40)
                : BorderRadius.circular(0)),
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
                });
              },
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, top: height * 0.02),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    transform: Matrix4.translationValues(profileXOffset, 0, 0)
                      ..rotateZ(isDrawerOpen ? -150 : 0),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn,
                    child: CircleAvatar(
                      radius: width * 0.07,
                      backgroundImage: AssetImage('assets/img/profile.png'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, top: height * 0.025),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi, Roakee',
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
                      EdgeInsets.only(top: height * 0.03, right: width * 0.05),
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
            Stack(
              children: <Widget>[
                Column(children: <Widget>[
                  SizedBox(
                    height: height * heightScaleOfHead - 35,
                  ),

                  ///------------------------------------
                  ///卡片部分
                  ///------------------------------------
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: isDrawerOpen
                  //           ? BorderRadius.circular(40)
                  //           : BorderRadius.circular(0)),
                  //   height: height * (1 - heightScaleOfHead) + 35,
                  //   child: GridView(
                  //     physics: BouncingScrollPhysics(),

                  //     // children: List.generate(50, (index) {
                  //     //   return Container(
                  //     //     child: Card(
                  //     //       color: Colors.amber,
                  //     //     ),
                  //     //   );
                  //     // }),
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 3, childAspectRatio: 1),
                  //     children: habit,
                  //   ),
                  // ),
                ]),

                ///--------------------------------------------
                ///头部分
                ///--------------------------------------------
                // Container(
                //   height: height * heightScaleOfHead,
                //   decoration: BoxDecoration(
                //       color: Color.fromRGBO(108, 96, 224, 1),
                //       borderRadius: BorderRadius.only(
                //           topLeft: isDrawerOpen
                //               ? Radius.circular(40)
                //               : Radius.circular(0),
                //           bottomLeft: Radius.circular(30),
                //           bottomRight: Radius.circular(30))),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
