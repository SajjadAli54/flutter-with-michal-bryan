import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyTweenAnimation extends StatefulWidget {
  const MyTweenAnimation({super.key});

  @override
  State<MyTweenAnimation> createState() => _MyTweenAnimationState();
}

class _MyTweenAnimationState extends State<MyTweenAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 200).animate(_controller)
      ..addListener(() => setState(() => {}));

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _animation.value,
          width: _animation.value,
          child: const Center(
            child: FlutterLogo(size: 300),
          )),
    );
  }
}
