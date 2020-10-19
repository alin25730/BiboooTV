import 'dart:convert';
import 'package:flutter_app02/image.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'ApiPlayer.dart';
import 'package:flutter_app02/Apidemopage/search.dart';

Dio dio = Dio();

class Apidemo extends StatefulWidget {
  @override
  _ApidemoState createState() {
    // TODO: implement createState
    return _ApidemoState();
  }
}

class _ApidemoState extends State<Apidemo> {
  var data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '动漫',
          style: TextStyle(foreground: Paint()),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[50],
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) {
              //   return searchBar();
              // }));
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext zxc, int i) {
            var items = data[i];

            //手势
            return GestureDetector(
              onTap: () {
                var nav = Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext ctx) {
                  String idpa = (items['id']).toString();
                  String pm = (items['pm'].toString());
                  String lx = (items['lx'].toString());
                  String zx = (items['zt'].toString());
                  String time = (items['sytime'].toString());
                  String js = (items['js'].toString());
                  String tp = (items['tp']).toString();
                  // var gkdz = items['gkdz'];
                  // List list = jsonDecode(gkdz);
                  // print(list);
                  // var gk = (items['gkdz']);

                  return MyHomePage(idpa, pm, lx, zx, time, js, tp, items);
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black12))),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    ImageWidget(
                      url: items['tp'],
                      w: 130.0,
                      h: 180.0,
                    ),
                    new Container(
                      padding: EdgeInsets.only(left: 10.0),
                      width: 250.0,
                      height: 200.0,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(items['pm']),
                          Text(items['lx']),
                          Text(items['dq']),
                          Text(items['sytime']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  getApi() async {
    var response = await dio.get(
        'http://dbys.vip/api/v1/ys/type?type1=动漫&type2=全部&page=2&region=全部&sort=更新&year=2020');
    var sulft = response.data;
    print(sulft);
    setState(() {
      data = sulft['data'];
    });
  }
}
