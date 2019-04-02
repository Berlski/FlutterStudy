import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'http请求示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('http请求示例'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              var url = 'http://httpbin.org';
              //向url指向的地址发起get请求

              http.get(url).then((response) {
                print("状态：${response.statusCode}");
                print("正文：${response.body}");
              });
            },
            child: new Text('开启网络请求'),
          ),
        ),
      ),
    );
  }
}
