import 'package:flutter/material.dart';
import 'package:flutter_bryan/advanced/phone/myurl_launcher.dart';
import 'package:flutter_bryan/advanced/phone/permissions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: const MyUrlLauncher());
  }
}
