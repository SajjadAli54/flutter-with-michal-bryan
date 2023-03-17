import 'package:flutter/material.dart';

class MyAnimationBuilder extends StatefulWidget {
  const MyAnimationBuilder({super.key});

  @override
  State<MyAnimationBuilder> createState() => _MyAnimationBuilderState();
}

class _MyAnimationBuilderState extends State<MyAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _animation = Tween<double>(begin: 0, end: 300).animate(curve)
      ..addListener(() => setState(() => {}));

    _controller.forward();
  }

  Widget builder(BuildContext context, Widget? child) {
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
      animation: _animation,
      builder: builder,
    ));
  }
}
