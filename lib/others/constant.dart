import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

List<Widget> habit = [];

class HabitColorType {
  static const int red = 0;
  static const int purple = 1;
  static const int green = 2;
}

class HabitDayType {
  static const int EVERYDAY = 0;
  static const int EVERYWEEK = 1;
  static const int EVERYMONTH = 2;
}

class HabitItem extends StatefulWidget {
  HabitItem(this.nameItem, this.habitColorType, this.habitDayType, this.icon,this.goal,
      {Key key})
      : super(key: key);
  final String nameItem;
  final int habitColorType;
  final int habitDayType;
  final IconData icon;
  int goal;


  @override
  _HabitItemState createState() => _HabitItemState();
}

class _HabitItemState extends State<HabitItem> {
  Color colorbackG;
  Color colorIcon;
  Color colorDayTypeString;
  bool isLikedLocal = false;
  String habitDayTypeString;
  int completeness = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.habitColorType) {
      case HabitColorType.red:
        colorbackG = Color.fromRGBO(255, 234, 233, 1);
        colorIcon = Color.fromRGBO(255, 0, 0, 1);
        colorDayTypeString = Color.fromRGBO(255, 148, 147, 1);
        break;
      case HabitColorType.purple:
        colorbackG = Color.fromRGBO(237, 228, 255, 1);
        colorIcon = Color.fromRGBO(114, 48, 222, 1);
        colorDayTypeString = Color.fromRGBO(180, 145, 240, 1);
        break;
      case HabitColorType.green:
        colorbackG =  Color.fromRGBO(227, 255, 239, 1);
        colorIcon = Color.fromRGBO(63, 210, 140, 1);
        colorDayTypeString =Color.fromRGBO(164, 209, 186, 1);
        break;
    }

    switch(widget.habitDayType){
      case HabitDayType.EVERYDAY:
        habitDayTypeString = 'Every Day';
        break;
      case HabitDayType.EVERYMONTH:
        habitDayTypeString = 'Every Month';
        break;
      case HabitDayType.EVERYWEEK:
        habitDayTypeString = 'Every Week';
        break;
    }
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async{


    isLikedLocal = true;
    setState(() {
      if(isLikedLocal&&completeness<widget.goal){
        completeness+=1;
      }

    });
    if(completeness!=widget.goal) {
      Future.delayed(Duration(milliseconds: 700), () {
        isLikedLocal = !isLikedLocal;
        setState(() {

        });
      });
    }


    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorbackG,
      child: Column(
        children: [
          LinearPercentIndicator(
            curve: Curves.fastOutSlowIn,
            padding: EdgeInsets.zero,
            animation: true,
            animateFromLastPercent: true,
            width: (MediaQuery.of(context).size.width-60)/2,
            lineHeight: 5.0,
            animationDuration: 300,
            percent: completeness / widget.goal,
            linearStrokeCap: LinearStrokeCap.butt,
            backgroundColor: colorbackG,
            progressColor: colorIcon,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: LikeButton(
                  isLiked: isLikedLocal,
                  onTap: onLikeButtonTapped,
                    onLongPress: (){
                    completeness = 0;
                    isLikedLocal = false;
                    setState(() {

                    });
                    },
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xFFFFC107),
                      dotSecondaryColor: Color(0xFFFF9800),
                      dotThirdColor: colorIcon,
                      dotLastColor: colorDayTypeString,
                    ),
                    padding: EdgeInsets.only(bottom: 5.5,right: 1.5),
                    animationDuration: Duration(milliseconds: 700),
                    circleColor:
                    CircleColor(start: Color(0xFFFFC107), end: colorIcon),
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        widget.icon,
                        color: isLiked ? colorIcon : Colors.grey,
                        size: 35,
                      );
                    }
                    ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 35.0, left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.nameItem,
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
                  habitDayTypeString+" •  "+"$completeness / ${widget.goal}",
                  style: TextStyle(color: colorDayTypeString),
                )),
          ),
        ],
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
