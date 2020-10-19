import 'package:flutter/material.dart';
import 'package:flutter_app02/AboutDualog.dart';

class Star extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Gradient gradient = LinearGradient(colors: [
      Colors.blueAccent,
      Colors.greenAccent,
    ]);
    Shader shader = gradient.createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    return Scaffold(
      body: new Stack(children: [
        new AppBar(
          title: Text(
            '星 蝶 公 主',
            style: TextStyle(
              foreground: Paint()..shader = shader,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink[50],
          elevation: 0,
        ),
        new Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 75.0),
              child: Image.asset('assets/star.jpg'),
            ),
            Text('第三季海报'),
            Container(
              child: AbouTileDame(),
            )
          ],
        ),
      ]),
    );
  }
}
