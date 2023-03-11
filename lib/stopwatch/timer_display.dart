import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimeDisplay extends StatelessWidget {
  Duration duration = Duration.zero;
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;

  TimeDisplay({
    key,
    required this.duration,
    required this.onClear,
  }) : super(key: key);

  void _onClick() => onClear(duration);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            duration.toString(),
            style: TextStyle(
              fontSize: 40,
              color: color,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: _onClick,
        ),
      ],
    );
  }
}
