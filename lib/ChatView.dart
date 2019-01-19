import 'package:flutter/material.dart';
import 'ChatMessages.dart';

class ChatView extends StatefulWidget {
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
      ),
      body: ListView(
        children: <Widget>[
          ChatMessages(
            isFriend: true,
            isNotPrevious: true,
          ),
          ChatMessages(
            isFriend: false,
            isNotPrevious: true,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(child: Text("text here")),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
