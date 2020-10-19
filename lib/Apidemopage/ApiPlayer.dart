import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app02/Gravity/Move.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();

class MyHomePage extends StatefulWidget {
  MyHomePage(this.idpa, this.pm, this.lx, this.zx, this.time, this.js, this.tp,
      this.items);
  String idpa;
  String pm;
  String lx;
  String zx;
  String time;
  String js;
  String tp;
  var items;
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(idpa, pm, lx, zx, time, js, tp, items);
}

class _MyHomePageState extends State<MyHomePage> {
  String idpa;
  String pm;
  String lx;
  String zx;
  String time;
  String js;
  String tp;
  var item;

  List playList = [];
  String pNAME;
  _MyHomePageState(this.idpa, this.pm, this.lx, this.zx, this.time, this.js,
      this.tp, this.item);

  @override
  void initState() {
    super.initState();
    getdo();
  }

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
      appBar: AppBar(
        title: Text(pm),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black87, width: 1.0))),
          child: Row(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.network(
                  tp,
                  width: 150.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  width: 250.0,
                  height: 200.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('片名:' + pm),
                      Text('类型' + lx),
                      Text('集数' + zx),
                      Text('上映时间' + time),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
        Text(
          '介绍',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationThickness: 3,
            decorationStyle: TextDecorationStyle.wavy,
          ),
        ),
        Text(
          js,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            foreground: Paint()..shader = shader,
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Wrap(
            children: playList
                .map((danbai) => MaterialButton(
                      height: 40,
                      elevation: 5,
                      color: danbai['name'] == pNAME
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                      textColor: Colors.white,
                      child: Text(danbai['name']),
                      onPressed: () => {
                        pNAME = danbai['name'],
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return MyHoPage(
                            url: danbai['url'],
                          );
                        })),
                        setState(() {})
                      },
                    ))
                .toList(),
          ),
        ))
      ]),
    );
  }

  getdo() {
    playList = jsonDecode(item['gkdz']);
  }
}
