import 'dart:convert';
import 'package:flutter_app02/Gravity/Move.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app02/Apidemopage/loding.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app02/image.dart';

Dio dio = Dio();

class platPage extends StatefulWidget {
  var item;

  platPage(this.item);
  @override
  _platPageState createState() {
    // TODO: implement createState
    return _platPageState(item);
  }
}

class _platPageState extends State<platPage> {
  var items;
  Map map;
  bool rating;
  Map maps;
  String napp;
  List listr;
  List itom;
  String name;
  _platPageState(this.items);

  @override
  void initState() {
    super.initState();
    rating = true;
    getuo();
  }

  getuo() async {
    var response = await dio.get('http://dbys.vip/api/v1/ys/${items['id']}');
    var sult = response.data;
    rating = false;
    map = sult['data'];
    napp = (map['gkdz'].toString());
    itom = jsonDecode(napp);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return rating
        ? lodingWidget()
        : Scaffold(
            appBar: AppBar(
              title: Text(map['pm']),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ImageWidget(
                            url: map['tp'],
                            w: 130.0,
                            h: 180.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('导演:' + map['dy']),
                                Container(
                                  width: 150.0,
                                  child: Text(
                                    '演员:' + map['zy'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text('类型:' + map['lx']),
                                Text('地区:' + map['dq'])
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    '介绍',
                    style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
                  ),
                ),
                Text(
                  map['js'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Wrap(
                    children: itom
                        .map((e) => MaterialButton(
                            height: 40,
                            elevation: 5,
                            color: Colors.blueAccent,
                            child: Text(e['name']),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MyHoPage(
                                  url: e['url'],
                                );
                              }));
                            }))
                        .toList(),
                  ),
                )
              ],
            ));
  }
}
