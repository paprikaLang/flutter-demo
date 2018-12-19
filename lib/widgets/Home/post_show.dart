import 'package:flutter/material.dart';
import '../../model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;
  PostShow({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(post.imageUrl),
          Container(
            padding: EdgeInsets.all(32),
            width: double.infinity, // 占满
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${post.title}', style: Theme.of(context).textTheme.title),
                SizedBox(height: 12),
                Text('${post.author}',
                    style: Theme.of(context).textTheme.title),
              ],
            ),
          )
        ],
      ),
    );
  }
}
