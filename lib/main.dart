import 'package:flutter/material.dart';
// import 'Home.dart';
// import 'Sliver.dart';
import 'Nav.dart';
import 'widgets/Home/ListContainer.dart';
import 'widgets/LogIn/login_form.dart';
import 'widgets/Card/Cards.dart';
import 'widgets/Stepper/StepperWork.dart';
import 'widgets/State/state_management.dart';
import 'widgets/Stream/stream_demo.dart';

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
      initialRoute: '/stream',
      routes: {
        '/': (context) => ListContainer(),
        '/about': (context) => Page(title: 'about'),
        '/form': (context) => LoginForm(),
        '/card': (context) => Cards(),
        '/stepper': (context) => StepperWork(),
        '/state': (context) => StateManagement(),
        '/stream': (context) => StreamDemo(),
      },
      theme: ThemeData(
          primarySwatch: Colors.orange,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white54,
          accentColor: Color.fromRGBO(233, 33, 33, 1)),
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
