import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  @override
  void initState() {
    super.initState();
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo.listen(onData);
  }

  void onData(String data) {
    print('listen: $data');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'hello world';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}
