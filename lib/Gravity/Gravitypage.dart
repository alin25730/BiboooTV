import 'package:flutter/material.dart';

class Falls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Gradient gradient = LinearGradient(colors: [
      Colors.blueGrey,
      Colors.greenAccent,
    ]);
    Shader shader = gradient.createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    return Scaffold(
      body: Stack(
        children: [
          AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(500, 179, 224, 247),
            elevation: 0,
            title: Text(
              '马 男 波 杰 克',
              style: TextStyle(
                foreground: Paint()..shader = shader,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 80.0)),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/mamen.jpg')),
              Text(
                  '《马男波杰克》讲述了一个被拟人化了的、热爱威士忌的马——波杰克（威尔·阿内奈配音），和他的人类朋友陶德（亚伦·保罗配音）共同生活的故事。其他角色还包括波杰克的经纪人兼前女友、由艾米·塞德丽丝（Amy Sedaris）配音的卡罗琳公主。该剧风格以幽默为主，但同时有许多黑暗、抑郁的场景，受到观众、媒体的好评')
            ],
          )
        ],
      ),
    );
  }
}
