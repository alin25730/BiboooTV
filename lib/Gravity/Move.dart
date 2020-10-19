import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class MyHoPage extends StatefulWidget {
  MyHoPage({Key, key, this.id, this.pm, this.url, this.zt}) : super(key: key);
  String url;
  String uk;
  String pm;
  int id;
  String zt;

  @override
  _MyHoPageState createState() {
    // TODO: implement createState
    return _MyHoPageState(url, pm);
  }
}

class _MyHoPageState extends State<MyHoPage> {
  String url;
  String pm;
  _MyHoPageState(this.url, this.pm);
  final FijkPlayer player = FijkPlayer();
  DateTime _data = DateTime.now();
  @override
  void initState() {
    super.initState();
    player.setDataSource(url, autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('去吧少年'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child: FijkView(
                width: 500.0,
                height: 300.0,
                fit: FijkFit(
                    sizeFactor: -0.5,
                    aspectRatio: -1,
                    alignment: Alignment.center),
                color: Colors.white,
                player: player,
              ),
            ),
            Container(
              height: 350.0,
              child: DayPicker(
                  selectedDate: _data,
                  currentDate: DateTime.now(),
                  onChanged: (data) {
                    setState(() => _data = data);
                  },
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  displayedMonth: DateTime.now()),
            )
          ],
        ));
  }
}
