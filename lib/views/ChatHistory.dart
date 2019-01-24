import 'package:flutter/material.dart';
import '../ChatHead.dart';
import 'Helper.dart';

class ChatHistory extends StatefulWidget {
  _ChatHistoryState createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: FutureBuilder(
        future: loadJsonFileAsMap(context, 'assets/recentChats.json'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<ChatHead> templist = List();
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Map<String, dynamic> tempMap = snapshot.data;
              tempMap.forEach((_key, _value) {
                print('VALUE: $_value');
                DateTime messageTime = DateTime.fromMillisecondsSinceEpoch(
                    _value["last_message"]["timestamp"]);
                templist.add(ChatHead(
                  friendName: _value["display_name"],
                  lastMessage: _value['last_message']["content"],
                  messageTime: messageTime,
                  friendId: _key,
                  avatarUrl: _value['avatar'],
                ));
              });
              return ListView(
                children: templist,
              );
            } else {
              return Text('has no data');
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      )
          // ListView(
          //   children: <Widget>[
          //     ChatHead(
          //         friendName: "paprikaLang",
          //         lastMessage: "call me later",
          //         messageTime: DateTime.now())
          //   ],
          // ),
          ),
    );
  }
}
