import 'package:flutter/material.dart';

class MyTransformation extends StatefulWidget {
  const MyTransformation({super.key});

  @override
  State<MyTransformation> createState() => _MyTransformationState();
}

class _MyTransformationState extends State<MyTransformation> {
  late double x, y, z;

  @override
  void initState() {
    super.initState();
    x = 0.0;
    y = 0.0;
    z = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("X:"),
              Slider(
                value: x,
                onChanged: (double value) {
                  setState(() {
                    x = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Y:"),
              Slider(
                  value: y,
                  onChanged: (double value) {
                    setState(() {
                      y = value;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Z:"),
              Slider(
                value: z,
                onChanged: (double value) {
                  setState(() {
                    z = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Transform(
            transform: Matrix4.skewY(y),
            child: Transform(
              transform: Matrix4.skewX(x),
              child: Transform(
                transform: Matrix4.rotationZ(z),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 200,
                  child: InteractiveViewer(
                      child: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
