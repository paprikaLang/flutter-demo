import 'package:flutter/material.dart';

class StateManagement extends StatefulWidget {
  @override
  _StateManagementState createState() => _StateManagementState();
}

class _StateManagementState extends State<StateManagement> {
  int _count = 0;
  void count() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State'),
        elevation: 0.0,
      ),
      body: Center(
        child: Counter(_count, count),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: count,
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int _count;
  final VoidCallback count;
  Counter(this._count, this.count);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ActionChip(
        label: Text('$_count'),
        onPressed: count,
      ),
    );
  }
}
