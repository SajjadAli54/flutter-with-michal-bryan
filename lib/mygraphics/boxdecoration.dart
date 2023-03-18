import 'package:flutter/material.dart';

class MyBoxDecoration extends StatefulWidget {
  const MyBoxDecoration({super.key});

  @override
  State<MyBoxDecoration> createState() => _MyBoxDecorationState();
}

class _MyBoxDecorationState extends State<MyBoxDecoration> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("BoxDecoration"),
          Container(
            padding: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
                width: 2.0,
              ),
              gradient: const LinearGradient(
                colors: [Colors.red, Colors.yellow],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: InteractiveViewer(
                child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
          ),
        ],
      ),
    );
  }
}
