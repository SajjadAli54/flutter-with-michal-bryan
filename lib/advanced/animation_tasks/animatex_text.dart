import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyAnimatedText extends StatefulWidget {
  const MyAnimatedText({super.key});

  @override
  State<MyAnimatedText> createState() => _MyAnimatedTextState();
}

class _MyAnimatedTextState extends State<MyAnimatedText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 20.0,
                height: 100.0,
              ),
              const Text(
                "Be",
                style: TextStyle(fontSize: 43.0),
              ),
              const SizedBox(
                width: 20.0,
                height: 100.0,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('AWESOME'),
                    RotateAnimatedText('OPTIMISTIC'),
                    RotateAnimatedText('DIFFERENT'),
                  ],
                  totalRepeatCount: 3,
                  onTap: () {
                    debugPrint("Tap Event");
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
