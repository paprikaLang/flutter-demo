import 'package:flutter/material.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeBottomBarState();
  }
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _currentIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
    debugPrint(_currentIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        type: BottomNavigationBarType.fixed, // 三个以上的items类型需要重新设值!
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Mine'),
          ),
        ]);
  }
}