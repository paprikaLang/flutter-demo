import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  _ChatMessagesState createState() => _ChatMessagesState();

  final bool isFriend;
  final bool isNotPrevious;
  final String message;
  final String friendInitial;
  final String avatarUrl;
  ChatMessages(
      {Key key,
      this.isFriend: false,
      this.isNotPrevious: false,
      this.message: "",
      this.avatarUrl: '',
      this.friendInitial: ""})
      : super(key: key);
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(18.0),
        // height: 100.0,
        width: double.infinity,
        color: Colors.teal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 32.0,
              child: widget.isFriend && widget.isNotPrevious
                  ? CircleAvatar(
                      backgroundImage: Image.network(widget.avatarUrl).image,
                      radius: 20.0,
                      backgroundColor: Colors.white,
                      // child: Text(widget.friendInitial),
                    )
                  : Container(),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(widget.message),
            )),
            !widget.isFriend && widget.isNotPrevious
                ? CircleAvatar(
                    backgroundImage: Image.asset('assets/avatar.jpg').image,
                    radius: 34.0,
                    backgroundColor: Colors.white,
                    child: Text("Me"),
                  )
                : Container(),
          ],
        ));
  }
}
