import 'package:flutter/material.dart';
import '../../model/post.dart';

class ListContainer extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(height: 18.0),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subhead,
              ),
              SizedBox(height: 18.0),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent, // 透明
              child: InkWell(
                splashColor: Colors.white.withOpacity(.3),
                highlightColor: Colors.white.withOpacity(.1),
                onTap: () {
                  debugPrint('tap');
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
