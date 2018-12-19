import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.toUpperCase()),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[TextdfieldDemo()],
          ),
        ),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

class TextdfieldDemo extends StatefulWidget {
  @override
  _TextdfieldDemoState createState() => _TextdfieldDemoState();
}

class _TextdfieldDemoState extends State<TextdfieldDemo> {
  final _textfieldController = TextEditingController();
  @override
  void dispose() {
    _textfieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textfieldController.addListener(() {
      debugPrint('input listener: ${_textfieldController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textfieldController,
      // onChanged: (value) {
      //   debugPrint('input: $value');
      // },
      onSubmitted: (value) {
        // 提交时统计输出的内容
        debugPrint('submit: $value');
      },
      decoration: InputDecoration(
          icon: Icon(Icons.verified_user),
          labelText: 'Username',
          hintText: 'Enter the username',
          filled: true,
          fillColor: Color.fromRGBO(233, 233, 233, 0.3),
          // border: OutlineInputBorder(),
          border: InputBorder.none),
    );
  }
}
