import 'package:flutter/material.dart';
import 'ListContainer.dart';
import 'UserDrawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation',
          //   onPressed: () => debugPrint('press in'),
          // ),
          title: Text('paprikaLang.github.io'),
          elevation: 0.0, // 阴影
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () => debugPrint('search in'),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListContainer(),
            Icon(Icons.change_history, size: 100.0, color: Colors.black26),
            Icon(Icons.directions_bike, size: 100.0, color: Colors.black26),
          ],
        ),
        drawer: UserDrawer(),
        bottomNavigationBar: BottomNavigationBar(
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
                title: Text('My'),
              ),
            ]),
      ),
    );
  }
}
