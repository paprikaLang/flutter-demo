import 'package:flutter/material.dart';
import 'ListContainer.dart';

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
        drawer: Drawer(
          // 自动添加 navigator leading iconbutton
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // DrawerHeader(
              //   child: Text('Tiyo'.toUpperCase()),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[200],
              //   ),
              // ),
              UserAccountsDrawerHeader(
                accountName:
                    Text('TIYO', style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text('langtianyao1102@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://paprika-dev.b0.upaiyun.com/LlVRb2Ud8wxftuYafiVzXdFOnwbQKciSMVvpIaCL.jpeg'),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://paprika-dev.b0.upaiyun.com/om3jkIT4nVK8WwYN8K9WyxEghHDk36WpEfgY8Ta3.jpeg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.orange[200].withOpacity(0.5),
                            BlendMode.hardLight))),
              ),
              ListTile(
                title: Text('Message', textAlign: TextAlign.right),
                trailing:
                    Icon(Icons.message, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Settings', textAlign: TextAlign.right),
                trailing:
                    Icon(Icons.settings, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Favorite', textAlign: TextAlign.right),
                trailing:
                    Icon(Icons.favorite, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
