import 'package:flutter/material.dart';
import 'widgets/Home/ListContainer.dart';
import 'widgets/Home/HomeBottomBar.dart';
import 'widgets/Home/UserDrawer.dart';
import 'widgets/Second/Second.dart';
import 'widgets/View/View.dart';
import 'widgets/Grid/Grid.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
              Tab(icon: Icon(Icons.view_column)),
              Tab(icon: Icon(Icons.view_list)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListContainer(),
            Second(),
            View(),
            GridDemo(),
          ],
        ),
        drawer: UserDrawer(),
        bottomNavigationBar: HomeBottomBar(),
      ),
    );
  }
}
