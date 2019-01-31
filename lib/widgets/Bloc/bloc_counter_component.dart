import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = CounterProvider.of(context).bloc;
    return Center(
        child: StreamBuilder(
      initialData: 0,
      stream: _bloc.revCount,
      builder: (context, snapshot) {
        return ActionChip(
          label: Text('${snapshot.data}'),
          onPressed: () {
            // _bloc.log();
            _bloc.counter.add(1);
          },
        );
      },
    ));
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _bloc.counter.add(1);
      },
    );
  }
}

//使用 InheritedWidget 基类 传递BLoc, 用streamcontroller的sink输入数据, stream输出数据
class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child, this.bloc})
      : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;
  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final _dataController = StreamController<int>();
  final _controller = StreamController<int>();
  StreamSink<int> get counter => _controller.sink;
  Stream<int> get revCount => _dataController.stream;
  CounterBloc() {
    _controller.stream.listen(onData);
  }
  void onData(data) {
    print(data);
    _count = _count + data;
    _dataController.add(_count);
  }

  void dispose() {
    _controller.close();
    _dataController.close();
  }

  void log() {
    print('log: bloc');
  }
}
