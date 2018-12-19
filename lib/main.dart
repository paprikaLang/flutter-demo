import 'package:flutter/material.dart';
// import 'Home.dart';
// import 'Sliver.dart';
import 'Nav.dart';
import 'widgets/Home/ListContainer.dart';

void main() {
  runApp(App());
}

// 自定义小部件
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ListContainer(),
      initialRoute: '/',
      routes: {
        '/': (context) => ListContainer(),
        '/about': (context) => Page(title: 'about'),
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white54,
      ),
    );
  }
}

// class Hello extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'hello world',
//         textDirection: TextDirection.ltr,
//         style: TextStyle(
//             fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black45),
//       ),
//     );
//   }
// }
