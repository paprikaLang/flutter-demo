import 'package:flutter/material.dart';
import '../../model/post.dart';

class GridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridBuilder();
  }
}

class GridBuilder extends StatelessWidget {
  // 按需生成视图
  Widget _gridBuilder(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: _gridBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
    );
  }
}

class GridExtent extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[500],
        alignment: Alignment(0.0, 0.0),
        child: Text('item $index',
            style: TextStyle(fontSize: 12.0, color: Colors.black)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 120.0, // 垂直上item最大宽度
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      scrollDirection: Axis.horizontal,
      children: _buildTiles(54),
    );
  }
}

class GridCount extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[500],
        alignment: Alignment(0.0, 0.0),
        child: Text('item $index',
            style: TextStyle(fontSize: 12.0, color: Colors.black)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      scrollDirection: Axis.horizontal,
      children: _buildTiles(54),
    );
  }
}
