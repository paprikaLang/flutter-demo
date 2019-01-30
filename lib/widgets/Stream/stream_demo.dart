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
  StreamController<String> _streamController;
  StreamSink _sink;
  // String _data = '... ...'; streambuilder节省了setstate

  @override
  void initState() {
    super.initState();
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamController = StreamController<String>();
    _streamController = StreamController.broadcast();
    // _streamSubscription =
    //     _streamDemo.listen(onData, onError: onEror, onDone: onDone);
    _streamSubscription = _streamController.stream
        .listen(onData, onDone: onDone, onError: onError);
    _streamController.stream.listen(onDatas, onDone: onDone, onError: onError);
    _sink = _streamController.sink;
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void onDone() {
    print('done');
  }

  void onError(error) {
    print('Error: $error');
  }

  void onData(String data) {
    print('listen: $data');
    // setState(() {
    //   _data = data;
    // });
  }

  void onDatas(String data) {
    print('listenonDatas: $data');
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

  void _onAddDataToStream() async {
    print('add data to stream.');
    String data = await fetchData();
    // _streamController.add(data);
    _sink.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    //throw 'sth wrong'; //出现异常按F5继续执行
    return 'hello world ~~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(_data), streambuilder 会根据stream中的数据重新创建部件,而不必再setstate了
              StreamBuilder(
                stream: _streamController.stream,
                initialData: '... ...',
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                },
              ),
              Row(
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
                  FlatButton(
                    child: Text('addDataToStream'),
                    onPressed: _onAddDataToStream,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
