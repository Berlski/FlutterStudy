import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
    );
  }
}

//有状态组件，通过状态生成单词对
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

//持有组件状态
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //单词对数组，用来存储生成的单词对

  final _saved = new Set<WordPair>(); //单词对Set集合，用来存储用户喜欢的单词对

  final _biggerFont = const TextStyle(
      fontSize: 18.0,
      color: Colors.red); //字体样式: fontSize 字体大小，color 字体颜色（设定完成必须重新运行）

  @override
  Widget build(BuildContext context) {
    //生成单词对
    /*final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);*/

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),

        //按钮组件，用来开启收藏列表页面
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),

      body: _buildSuggestions(),


    );
  }

  //方法用来开启收藏夹页面（路由）
  //当用户点击导航栏中的列表图标时，建立一个路由并将其推入到导航管理器栈中。此操作会切换页面以显示新路由。
  void _pushSaved() {
    //Navigator.push调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）
    Navigator.of(context).push(
      //MaterialPageRoute及其builder。
      new MaterialPageRoute(
        //新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数。
        builder: (context) {
          //生成ListTile行
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                  title: Center(
                    child: new Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  ));
            },
          );

          //ListTile的divideTiles()方法在每个ListTile之间添加1像素的分割线。 该 divided 变量持有最终的列表项。
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          //builder返回一个Scaffold，其中包含名为“Saved Suggestions”的新路由的应用栏。 新路由的body由包含ListTiles行的ListView组成; 每行之间通过一个分隔线分隔。
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  //函数返回一个listView列表
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    //通过单词对，到Set集合中比对，查看是否存在
    final alreadySaved = _saved.contains(pair);

    Icon icon = new Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border, //形状：实心心形、空心心形
      color: alreadySaved ? Colors.red : Colors.green, //颜色
    );

    return new ListTile(
      title: new Center(
        child: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      ),

      //Icon 图标
      trailing:
      icon /*new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border, //形状：实心心形、空心心形
        color: alreadySaved ? Colors.red : Colors.green, //颜色
      )*/
      ,

      //点击响应：在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
      onTap: () {
        setState(() {
          //通过判断是否在Set集合是否存在，来增删
          if (alreadySaved) {
            _pushNewSaved();
            //_saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  //方法用来开启收藏夹页面（路由）
  //当用户点击导航栏中的列表图标时，建立一个路由并将其推入到导航管理器栈中。此操作会切换页面以显示新路由。
  void _pushNewSaved() {
    //Navigator.push调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）
    Navigator.of(context).push(
      //MaterialPageRoute及其builder。
      new MaterialPageRoute(
        //新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数。
        builder: (context) {
          //builder返回一个Scaffold，其中包含名为“Saved Suggestions”的新路由的应用栏。 新路由的body由包含ListTiles行的ListView组成; 每行之间通过一个分隔线分隔。
          return new Scaffold(
            appBar: new AppBar(
              title: Text('新页面'),
            ),
            body: Center(
              child: new Text('居中'),
            ),
            bottomNavigationBar: BottomAppBar(
              child: new Text('底部显示的文字'),
            ),
          );
        },
      ),
    );
  }
}
