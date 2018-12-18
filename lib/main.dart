import 'package:flutter/material.dart';
import 'model/post.dart';
import 'widgets/Home.dart';
import 'widgets/ListContainer.dart';
void main() {
  runApp(App());
}

// 自定义小部件
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello world',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black45),
      ),
    );
  }
}
