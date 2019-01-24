import 'package:flutter/material.dart';
// import 'ChatHead.dart';
// import 'ChatView.dart';
import 'views/ChatHistory.dart';
import 'views/HomeView.dart';
import 'views/SettingsView.dart';

class ChatApp extends StatefulWidget {
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mechat"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {},
            )
          ],
        ),
        body: selectedScreen(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline), title: Text("Chats")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text("Settings"))
          ],
          onTap: (int index) {
            print("index is " + index.toString());
            setState(() {
              _currentIndex = index;
            });
          },
        ), //点击'问题' 智能添加required argument item
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
      // home: ChatView()
    );
  }

  Widget selectedScreen(int _index) {
    switch (_index) {
      case 0:
        return HomeView();
        break;
      case 1:
        return ChatHistory();
        break;
      case 2:
        return SettingsView();
        break;
      default:
        return HomeView();
        break;
    }
  }
}
