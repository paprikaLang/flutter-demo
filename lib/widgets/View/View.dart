import 'package:flutter/material.dart';
import '../../model/post.dart';

class View extends StatelessWidget {
  Widget _itembuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          // expand 占满所有可用空间
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            children: <Widget>[
              Text(posts[index].author,
                  style: TextStyle(color: Colors.white, fontSize: 22.0)),
              Text(posts[index].title,
                  style: TextStyle(color: Colors.white, fontSize: 22.0))
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _itembuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      //scrollview
      // pageSnapping: false, //auto half decision
      reverse: true,
      scrollDirection: Axis.vertical, //垂直翻滚页面
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),
      controller: PageController(
          initialPage: 1, keepPage: true, viewportFraction: 0.85),
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
