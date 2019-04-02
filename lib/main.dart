import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '使用第三方库',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('使用第三方库'),
        ),
        body: new Center(
          child: new RaisedButton(
            color: Colors.white,
            onPressed: () {
              //指定url 并发起请求
              const url ='https://www.baidu.com';
              launch(url);
            },

            child: new Text('打开百度'),
          ),
        ),
      ),
    );
  }
}
