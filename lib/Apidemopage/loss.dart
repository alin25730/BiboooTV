import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '失败页面',
    home: losser(),
  ));
}

class losser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('失败页面'),
      ),
      body: Center(
        child: Text('错误页面'),
      ),
    );
  }
}
