# Flutter Animations

- [Tween Animations](#tween)
- [Animation Builder](#builder)
- [Listener](#listener)
- [Animated Widget](#widget)

## Tween Animations

<div id="tween"></div>

```dart
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
```

## Animation Builder

<div id="builder"></div>

```dart
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
```

## Listener

<div id="listener"></div>

```dart
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
```

## Animated Widget

<div id="widget"></div>

```dart
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
```
