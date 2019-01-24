import 'package:flutter/material.dart';
import 'ChatMessages.dart';
import './views/Helper.dart';

class ChatView extends StatefulWidget {
  _ChatViewState createState() => _ChatViewState();
  final String friendName;
  final String lastMessage;
  final String avatarUrl;
  final String friendId;
  ChatView(
      {Key key,
      this.friendName: "",
      this.lastMessage: "",
      this.avatarUrl: "",
      this.friendId: ""})
      : super(key: key);
}

class _ChatViewState extends State<ChatView> {
  String _friendInitial;
  TextEditingController _controller = TextEditingController();
  void initState() {
    setState(() {
      _friendInitial = widget.friendName.substring(0, 1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
              child: FutureBuilder(
            future: loadJsonFileAsMap(context, 'assets/messageDetails.json'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  int _index = 0;
                  Map<String, dynamic> tempMap = snapshot.data;
                  List<ChatMessages> chatMessageWidgets = List();

                  tempMap.forEach((_key, _value) {
                    List<dynamic> _messageList = _value['messages'];
                    _messageList.forEach((_message) {
                      chatMessageWidgets.add(ChatMessages(
                        isFriend: true,
                        isNotPrevious: tempMap.length - 1 == _index,
                        message: _message['content'],
                        friendInitial: _friendInitial,
                        avatarUrl: _value['avatar'],
                      ));
                      _index++;
                    });
                  });
                  return ListView(
                    children: chatMessageWidgets,
                  );
                }
              }
            },
          )
              // ListView(
              //   children: <Widget>[
              //     ChatMessages(
              //       isFriend: true,
              //       isNotPrevious: true,
              //       friendInitial: _friendInitial,
              //       message: widget.lastMessage,
              //     ),
              //   ],
              // ),
              ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                  controller: _controller,
                  onFieldSubmitted: (String _msg) {
                    print(_msg);
                  },
                  decoration:
                      InputDecoration(hintText: "Type your message here..."),
                )),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.teal,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
