import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = CounterProvider.of(context).bloc;
    return Center(
      child: ActionChip(
        label: Text('0'),
        onPressed: () {
          _bloc.log();
        },
      ),
    );
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
  final _controller = StreamController<int>();
  StreamSink<int> get counter => _controller.sink;

  CounterBloc() {
    _controller.stream.listen(onData);
  }
  void onData(data) {
    print(data);
  }

  void dispose() {
    _controller.close();
  }

  void log() {
    print('log: bloc');
  }
}
