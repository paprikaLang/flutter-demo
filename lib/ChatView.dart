import 'package:flutter/material.dart';
import 'ChatMessages.dart';

class ChatView extends StatefulWidget {
  _ChatViewState createState() => _ChatViewState();
  final String friendName;
  final String lastMessage;
  ChatView({Key key, this.friendName: "", this.lastMessage: ""})
      : super(key: key);
}

class _ChatViewState extends State<ChatView> {
  String _friendInitial;
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
            child: ListView(
              children: <Widget>[
                ChatMessages(
                  isFriend: true,
                  isNotPrevious: true,
                  friendInitial: _friendInitial,
                  message: widget.lastMessage,
                ),
                // ChatMessages(
                //   isFriend: false,
                //   isNotPrevious: true,
                //   friendInitial: _friendInitial,
                // ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(child: TextFormField()),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
