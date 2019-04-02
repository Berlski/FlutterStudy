import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void getData() async {
    try {
      //实例化一个HttpClient对象
      HttpClient httpClient = new HttpClient();

      //发起请求
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse("http://t.weather.sojson.com/api/weather/city/101200101"));

      //等待服务器返回数据
      HttpClientResponse response = await request.close();

      //使用utf8.decoder 从 response 里解析数据
      var result = await response.transform(utf8.decoder).join();

      //输出响应头
      print(result);

      httpClient.close();
    } catch (e) {
      //输出响应头
      print(e);
    } finally {
      print('请求结束!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '使用HttpClient网络请求',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('HttpClient网络请求'),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: getData,
            child: new Text('开启HttpClient网络请求'),
          ),
        ),
      ),
    );
  }
}
