import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  @override
  void initState() {
    super.initState();
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamSubscription =
        _streamDemo.listen(onData, onError: onError, onDone: onDone);
  }

  void onDone() {
    print('done');
  }

  void onError(error) {
    print('Error: $error');
  }

  void onData(String data) {
    print('listen: $data');
  }

  void _onPause() {
    _streamSubscription.pause();
    print('subscription pause');
  }

  void _onResume() {
    _streamSubscription.resume();
    print('subscription resume');
  }

  void _onCancel() {
    _streamSubscription.cancel();
    print('subscription cancel');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    //throw 'sth wrong'; //出现异常按F5继续执行
    return 'hello world';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Pause'),
                onPressed: _onPause,
              ),
              FlatButton(
                child: Text('Resume'),
                onPressed: _onResume,
              ),
              FlatButton(
                child: Text('cancel'),
                onPressed: _onCancel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
