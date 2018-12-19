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
            children: <Widget>[RegisterForm()],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool _autovalidate = false;
  void submitRegisterForm() {
    if (_registerFormKey.currentState.validate()) {
      _registerFormKey.currentState.save();

      debugPrint('username: $username');
      debugPrint('password: $password');

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Registering ...'),
      ));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String validatorUsername(value) {
    if (value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'username'.toUpperCase(),
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validatorUsername,
            autovalidate: _autovalidate,
          ),
          TextFormField(
            obscureText: true, // 输入内容隐藏
            decoration: InputDecoration(
              labelText: 'password'.toUpperCase(),
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatorPassword,
            autovalidate: _autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: submitRegisterForm,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
              elevation: .0,
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
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

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}
