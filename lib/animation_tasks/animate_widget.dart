import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({super.key});

  @override
  State<MyAnimatedWidget> createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    ;

    _animation.addStatusListener(listener);
    _controller.forward();
  }

  void listener(AnimationStatus status) {
    setState(() => {
          if (status == AnimationStatus.completed)
            _controller.reverse()
          else if (status == AnimationStatus.dismissed)
            _controller.forward()
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedLogo(
      animation: _animation,
    ));
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);
  static final _rotateTween = Tween<double>(begin: 0, end: 12.0);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Center(
      child: Transform.rotate(
        angle: _rotateTween.evaluate(animation),
        child: Opacity(
            opacity: _opacityTween.evaluate(animation),
            child: Container(
              height: _sizeTween.evaluate(animation),
              width: _sizeTween.evaluate(animation),
              child: const FlutterLogo(),
            )),
      ),
    );
  }
}
