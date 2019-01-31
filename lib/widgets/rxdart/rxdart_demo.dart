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
  PublishSubject<String> _textfieldSubject;
  @override
  void initState() {
    super.initState();
    _textfieldSubject = PublishSubject<String>();
    _textfieldSubject
    .map((item) => 'map $item')
    .where((item) => item.length > 9)
    .debounce(Duration(milliseconds:500))
    .listen((data) => print(data));
    // _textfieldSubject.close();
    // Observable<String> _observable =
    //  Observable(Stream.fromIterable(['hello', '您好']));
    //Observable继承于Stream
    // Observable.fromFuture(Future.value('hello ~'));
    // Observable.fromIterable(['hello', 'world']);
    // Observable.just('hello just');
    // Observable.periodic(Duration(seconds: 1), (x) => x.toString());
    // _observable.listen(print);

    //如果是BehaviorSubject, 只取最后一次add, 进行listen
    // PublishSubject<String> _subject = PublishSubject<String>();
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);
    // _subject.add('add hello');
    // _subject.add('add world');
    // _subject.add('3rd add');
    // _subject.listen((data) => print('listen on 1: $data'));
    // _subject.listen((data) => print('listen on 2: ${data.toUpperCase()}'));

    //subject 相当于Stream中的Controller, 控制着Observable
    // _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black),
      child: TextField(
        decoration: InputDecoration(labelText: 'Title', filled: true),
        onChanged: (value) {
          _textfieldSubject.add('input: $value');
        },
      ),
    );
  }
}
