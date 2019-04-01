import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaApp());
}

class MaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';

    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        //应用程序整体主题的亮度 ,内容部分的亮度
        brightness: Brightness.light,
        //APP主要部分的背景颜色，标题栏的颜色
        primaryColor: Colors.red,
        //前景色：文本、按钮等
        accentColor: Colors.orange,
        textSelectionColor: Colors.white,
      ),
      home: new MyHome(
        title: appName,
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  final String title;

  const MyHome({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child: new Text(
            '带有背景颜色的文本组件',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.grey),
          child: new FloatingActionButton(
            onPressed: null,
            child: new Icon(
              Icons.computer,
              color: Colors.white,
            ),
          )),
    );
  }
}
