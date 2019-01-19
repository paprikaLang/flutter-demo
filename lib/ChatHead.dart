import 'package:flutter/material.dart';

class ChatHead extends StatefulWidget {
  _ChatHeadState createState() => _ChatHeadState();
}

class _ChatHeadState extends State<ChatHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      width: double.infinity,
      // height: 100,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("<Friend's name>",
                    style: Theme.of(context).textTheme.title),
                Text("Last Message", style: Theme.of(context).textTheme.body2),
                Text("Last Message Time")
              ],
            ),
          ),
          CircleAvatar(
            radius: 38.0,
            child: Text("T",
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .apply(color: Colors.white, fontWeightDelta: 3)),
          ),
        ],
      ),
      color: Colors.grey[300],
    );
  }
}
