import 'package:flutter/material.dart';

class StepperWork extends StatefulWidget {
  @override
  _StepperWorkState createState() => _StepperWorkState();
}

class _StepperWorkState extends State<StepperWork> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('login'),
                    subtitle: Text('login first'),
                    content: Text('play application  should login first'),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text('buy'),
                    subtitle: Text('login first'),
                    content: Text('play application  should login first'),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text('play'),
                    subtitle: Text('login first'),
                    content: Text('play application  should login first'),
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
