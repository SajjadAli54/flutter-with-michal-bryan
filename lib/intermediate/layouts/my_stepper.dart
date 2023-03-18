import 'package:flutter/material.dart';

class MySteper extends StatefulWidget {
  const MySteper({super.key});

  @override
  State<MySteper> createState() => _MySteperState();
}

class _MySteperState extends State<MySteper> {
  late List<Step> _steps;
  late int _currentStep;

  @override
  void initState() {
    super.initState();
    _currentStep = 0;
    _steps = const [
      Step(
          title: Text('Step 1'),
          content: Text('Step 1 Content | Do Something'),
          isActive: true),
      Step(
          title: Text('Step 2'),
          content: Text('Step 2 Content | Do Something'),
          isActive: false),
      Step(
          title: Text('Step 3'),
          content: Text('Step 3 Content | Do Something'),
          isActive: true),
      Step(
          title: Text('Step 4'),
          content: Text('Step 4 Content | Do Something'),
          isActive: true),
    ];
  }

  void stepContinue() => setState(() {
        if (_currentStep < _steps.length - 1) {
          _currentStep++;
        } else {
          _currentStep = 0;
        }
      });

  void stepCancel() => setState(() {
        if (_currentStep > 0)
          _currentStep--;
        else
          _currentStep = 0;
      });

  void stepTapped(int step) => setState(() => _currentStep = step);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stepper'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Stepper(
            steps: _steps,
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepContinue: stepContinue,
            onStepCancel: stepCancel,
            onStepTapped: stepTapped,
          ),
        ));
  }
}
