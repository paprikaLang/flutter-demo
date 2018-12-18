import 'package:flutter/material.dart';
import 'ListContainer.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('paprikaLang.github.io'),
        elevation: 0.0, // 阴影
      ),
      body: ListContainer(),
    );
  }
}