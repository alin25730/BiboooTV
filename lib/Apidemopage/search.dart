import 'dart:convert';
import 'package:flutter_app02/image.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app02/Gravity/Moplat.dart';

Dio dio = Dio();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: '输入片名/演员/导演',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  List play = [];
  List url = [];
  var item;

  @override
  TextInputType get keyboardType => TextInputType.text;

  _fetchPosts() async {
    var response = await dio.get('https://dbys.vip/api/v1/ys/search/$query');

    var data = response.data;
    play = data['data'];
    print(play);
    return play;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _fetchPosts(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: play.length,
              itemBuilder: (BuildContext zxc, int i) {
                item = play[i];

                return Column(
                  children: [
                    Text(item['pm']),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return platPage(item);
                        }));
                      },
                      child: Wrap(
                        children: [
                          ImageWidget(
                            url: item['tp'],
                            w: 130.0,
                            h: 180.0,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              });
        }

        return Container(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text('搜电影名字')),
      ],
    );
  }
}
