import 'package:flutter/material.dart';

List<Widget> habit = [];
// List<Widget> habit = List.generate(
//     30,
//     (index) => Container(
//           color: Color.fromRGBO(227, 255, 239, 1),
//         ));

class buildHabit2 extends StatelessWidget {
  buildHabit2(
      {Key key,
      this.colorOfIcon,
      this.colorOfTime,
      this.colorOfbackG,
      this.icon,
      this.subTitle,
      this.title})
      : super(key: key);

  Color colorOfbackG;
  Color colorOfIcon;
  Color colorOfTime;
  String title;
  String subTitle;
  IconData icon;

  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: colorOfbackG,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20, top: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    icon,
                    color: colorOfIcon,
                    size: 35,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 7),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    subTitle,
                    style: TextStyle(color: colorOfTime),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Container buildHabit(
  Color colorOfbackG,
  Color colorOfIcon,
  Color colorOfTime,
  String title,
  String subTitle,
  IconData icon,
) {
  return Container(
    color: colorOfbackG,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20, top: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                icon,
                color: colorOfIcon,
                size: 35,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.0, left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 7),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                style: TextStyle(color: colorOfTime),
              )),
        ),
      ],
    ),
  );
}
