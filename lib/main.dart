import 'package:flutter/material.dart';
import 'package:flutter_bryan/my_tab_bar.dart';

import 'expansion_panel.dart';

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
      home: const MyTabBar(),
    );
  }
}
