import 'package:flutter/material.dart';

class DidiSample extends StatefulWidget {
  @override
  _DidiSampleState createState() => _DidiSampleState();
}

class _DidiSampleState extends State<DidiSample> {
  Choice selecteChoice = choices[0];

  _selecte(Choice choice) {
    setState(() {
      selecteChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滴滴出行'),
        actions: <Widget>[
          new IconButton(icon: new Icon(choices[0].iconData), onPressed: null),
          new IconButton(icon: new Icon(choices[0].iconData), onPressed: null),
        ],
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData iconData;

  Choice({this.title, this.iconData});
}

List<Choice> choices = <Choice>[
  Choice(title: '自驾', iconData: Icons.directions_car),
  Choice(title: '自行车', iconData: Icons.directions_bike),
  Choice(title: '公交车', iconData: Icons.directions_bus),
  Choice(title: '地铁', iconData: Icons.directions_subway),
  Choice(title: '火车', iconData: Icons.directions_railway),
  Choice(title: '轮渡', iconData: Icons.directions_boat),
  Choice(title: '步行', iconData: Icons.directions_walk),
];
