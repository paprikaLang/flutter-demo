import 'package:flutter/material.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      //scrollview
      // pageSnapping: false, //auto half decision
      reverse: true,
      scrollDirection: Axis.vertical, //垂直翻滚页面
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),
      children: <Widget>[
        Container(
          color: Colors.brown[200],
          alignment: Alignment(0.0, .0),
          child: Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.green[100],
          alignment: Alignment(0.0, .0),
          child: Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.red[200],
          alignment: Alignment(0.0, .0),
          child: Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        )
      ],
    );
  }
}
