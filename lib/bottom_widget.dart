import 'package:flutter/material.dart';
import 'icon/icon.dart';
import 'Gravity/Gravitypage.dart';
import 'Gravity/Grotesque.dart';
import 'Gravity/Star.dart';
import 'Apidemopage/DioAPi.dart';

class BottomWidget extends StatefulWidget {
  @override
  _BottomWidgetState createState() {
    // TODO: implement createState
    return _BottomWidgetState();
  }
}

class _BottomWidgetState extends State<BottomWidget> {
  final bottomColor = Colors.cyanAccent;
  int _currenIndex = 0;
  List<Widget> list = List();
  @override
  void initState() {
    super.initState();
    list..add(Star())..add(Falls())..add(Meibao())..add(Apidemo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: list[_currenIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Myicon.star,
                color: bottomColor,
              ),
              title: Text(
                'Star',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Myicon.ma,
                  color: bottomColor,
                ),
                title: Text(
                  '波杰克',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(Myicon.meibao, color: bottomColor),
                title: Text(
                  '梅宝',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(Myicon.Mv, color: bottomColor),
                title: Text(
                  '观看',
                  style: TextStyle(color: Colors.black),
                )),
          ],
          currentIndex: _currenIndex,
          onTap: (int index) {
            setState(() {
              _currenIndex = index;
            });
          },
          type: BottomNavigationBarType.shifting,
        ));
  }
}
