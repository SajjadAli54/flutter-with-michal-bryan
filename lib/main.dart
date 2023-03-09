import 'package:flutter/material.dart';
import 'package:flutter_bryan/charts/charts_demo.dart';
import 'package:flutter_bryan/steppar/my_stepper.dart';

import 'gridview/mygridview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyChartsDemo(),
    );
  }
}
