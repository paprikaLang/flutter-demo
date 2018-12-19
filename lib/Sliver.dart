import 'package:flutter/material.dart';
import './model/post.dart';

class SliverWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('paprikaLang'.toUpperCase()),
            pinned: false,
            floating: true, // list 向下拉即显示 appbar
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('paprikaLang'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w400)),
              background: Image.network(
                  'https://paprika-dev.b0.upaiyun.com/om3jkIT4nVK8WwYN8K9WyxEghHDk36WpEfgY8Ta3.jpeg',
                  fit: BoxFit.cover),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverListComponent(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: Material(
              borderRadius: BorderRadius.circular(25.0),
              elevation: 15.0, // 阴影
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child:
                        Image.network(posts[index].imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(posts[index].author,
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(posts[index].title,
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                  )
                ],
              )),
        );
      }, childCount: posts.length),
    );
  }
}

class SliverGridComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        );
      }, childCount: posts.length),
    );
  }
}
