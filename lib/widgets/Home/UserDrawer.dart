import 'package:flutter/material.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                Text('Tiyo', style: TextStyle(fontWeight: FontWeight.bold)),
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
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
