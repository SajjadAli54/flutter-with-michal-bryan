import 'package:flutter/material.dart';
import 'package:flutter_bryan/animation_tasks/animate_widget.dart';
import 'package:flutter_bryan/animation_tasks/animation_builder.dart';
import 'package:flutter_bryan/animation_tasks/listener.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const MyAnimatedWidget(),
    );
  }
}
