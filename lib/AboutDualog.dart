import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AbouTileDame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 100.0,
      padding: EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(),
      alignment: Alignment.center,
      child: AboutListTile(
        icon: Icon(
          Icons.local_convenience_store,
          color: Colors.blue,
        ),
        applicationName: '原 作 介 绍',
        applicationVersion: 'v0.0.1',
        applicationLegalese: 'Copyright💨2020 Bibooo',
        child: MaterialButton(
            child: Text(
              "作者博客",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () async {
              const url = 'https://bibooo.top/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            }),
        aboutBoxChildren: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('动漫微剧场是【Bibooo】的开源项目 ,'
                '收录了很多动漫作品,并附加详细介绍.'
                '本人也是无比喜欢Star,还有迪士尼作品.'
                '保持一颗童心,还是挺好的.'
                ''),
          ),
        ],
      ),
    );
  }
}
