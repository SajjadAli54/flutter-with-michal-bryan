import 'package:flutter/material.dart';

class MyAnimationListener extends StatefulWidget {
  const MyAnimationListener({super.key});

  @override
  State<MyAnimationListener> createState() => _MyAnimationListenerState();
}

class _MyAnimationListenerState extends State<MyAnimationListener>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _animation = Tween<double>(begin: 0, end: 400).animate(curve);

    _animation.addStatusListener(listener);
    _controller.forward();
  }

  void listener(AnimationStatus status) {
    setState(() => {
          if (status == AnimationStatus.completed)
            {_controller.reverse()}
          else if (status == AnimationStatus.dismissed)
            {_controller.forward()}
        });
  }

  Widget builder(BuildContext context, Widget? child) {
    return Center(
      child: Container(
        height: _animation.value,
        width: _animation.value,
        child: const FlutterLogo(size: 300),
      ),
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
