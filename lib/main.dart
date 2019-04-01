import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//MyApp 不需要做状态处理 所以此组件继承 StatelessWidget
class MyApp extends StatelessWidget {
  //这个组件是整个应用的主组件
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '标题',
      home: new MyHomePage(
        title: 'asfs',
      ),
      theme: new ThemeData(
        accentColor: Colors.red,
        primaryColor: Colors.red,
        brightness: Brightness.light,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //标题
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  //必须重写 createState 方法
  @override
  _MyHomePagerState createState() => new _MyHomePagerState();
}

//状态类必须继承 State 类，注意后面需要指定为<MyHomePage>
class _MyHomePagerState extends State<MyHomePage> {
  int _counter = 0;

  //函数调用 State 中的 setState 方法，来更改状态值，使变量变化
  void _incrementCounter() {
    setState(() {
      //计数器变量，每次被调用数值加一
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '$_counter',
        ),
      ),

      //居中布局
      body: new Center(
        //垂直布局（满屏）
        child: new Column(
          //主轴居中对齐
          mainAxisAlignment: MainAxisAlignment.center,

          //子组件数组
          children: <Widget>[
            new Text(
              '这是一个神奇的按钮' + '$_counter',
              style: Theme.of(context).textTheme.body1,
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.body2,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'icon',
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
