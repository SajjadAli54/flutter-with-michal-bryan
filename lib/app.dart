import 'package:flutter/material.dart';
import 'package:flutter_bryan/transformation/transformation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const MyTransformation(),
    );
  }
}
