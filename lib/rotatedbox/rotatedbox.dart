import 'package:flutter/material.dart';

class MyRotatedBox extends StatefulWidget {
  const MyRotatedBox({super.key});

  @override
  State<MyRotatedBox> createState() => _MyRotatedBoxState();
}

class _MyRotatedBoxState extends State<MyRotatedBox> {
  int turns = 0;
  double values = 0;

  void onChange(double value) {
    setState(() {
      values = value;
      turns = value.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: values,
            min: 0,
            max: 4,
            divisions: 4,
            onChanged: onChange,
          ),
          RotatedBox(
            quarterTurns: turns,
            child: const Text('Hello World'),
          ),
        ],
      ),
    );
  }
}
