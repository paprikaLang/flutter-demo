import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rxdart'),
        elevation: 0.0,
      ),
      body: Center(
        child: RxDartDemoHome(),
      ),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    super.initState();
    // Observable<String> _observable =
    //  Observable(Stream.fromIterable(['hello', '您好']));
    //Observable继承于Stream
    // Observable.fromFuture(Future.value('hello ~'));
    // Observable.fromIterable(['hello', 'world']);
    // Observable.just('hello just');
    // Observable.periodic(Duration(seconds: 1), (x) => x.toString());
    // _observable.listen(print);
    PublishSubject<String> _subject = PublishSubject<String>();
    _subject.listen((data) => print('listen on 1: $data'));
    _subject.add('add data to stream');
    _subject.listen((data) => print('listen on 2: ${data.toUpperCase()}'));
    _subject.add('resume'); //subject 相当于Stream中的Controller, 控制着Observable
    _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
