import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagement extends StatefulWidget {
  _StateManagementState createState() => _StateManagementState();
}

// class _StateManagementState extends State<StateManagement> {
//   int _count = 0;
//   void count() {
//     setState(() {
//       _count += 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CounterProvider(
//       count: _count,
//       increaseCount: count,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('State'),
//           elevation: 0.0,
//         ),
//         body: Center(
//           child: Counter(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: count,
//         ),
//       ),
//     );
//   }
// }

class _StateManagementState extends State<StateManagement> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterScopedModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('State'),
          elevation: 0.0,
        ),
        body: Center(
          child: Counter(),
        ),
        floatingActionButton: ScopedModelDescendant<CounterScopedModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: model.increaseCount,
              ),
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Counter(),
    );
  }
}

// class Counter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final int _count = CounterProvider.of(context).count;
//     final VoidCallback count = CounterProvider.of(context).increaseCount;
//     return ActionChip(
//       label: Text('$_count'),
//       onPressed: count,
//     );
//   }
// }

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterScopedModel>(
      builder: (context, _, model) => ActionChip(
            label: Text('${model.count}'),
            onPressed: model.increaseCount,
          ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;
  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterScopedModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
