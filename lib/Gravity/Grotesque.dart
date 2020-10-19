import 'package:flutter/material.dart';

class Meibao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Gradient gradient = LinearGradient(colors: [
      Colors.greenAccent,
      Colors.black,
    ]);
    Shader shader = gradient.createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    return Scaffold(
        body: new Stack(
      children: [
        AppBar(
          title: Text('怪 诞 小 镇',
              style: TextStyle(
                foreground: Paint()..shader = shader,
              )),
          centerTitle: true,
          backgroundColor: Colors.red[300],
          elevation: 0,
        ),
        Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 80.0, left: 10.0),
                child: Image.asset('assets/Grat.jpg')),
            Text(
                '节目讲述了12岁的迪普和双胞胎姐姐梅宝被从加州的家中送到了一个虚构的俄勒冈小镇——重力泉镇，与住在那里，经营着满是欺骗游客陷阱的“神秘小屋”的斯坦叔公一同度过暑假.'
                '这个小镇并不像看上去的那样祥和平静，孩子们一边帮助斯坦经营满是欺骗游客陷阱的“神秘小屋（The Mystery Shack）”，一边调查当地神秘事件。在迪普从森林里发现的日志的帮助下，姐弟俩开始慢慢的解开这个小镇的种种谜团。随着迪普和梅宝的好朋友：收银员温蒂、勤杂工苏斯，以及各种角色的出现，让迪普和梅宝总能对新的一天充满期待。')
          ],
        )
      ],
    ));
  }
}
