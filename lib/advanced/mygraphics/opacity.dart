import 'package:flutter/material.dart';

class MyOpacity extends StatefulWidget {
  const MyOpacity({super.key});

  @override
  State<MyOpacity> createState() => _MyOpacityState();
}

class _MyOpacityState extends State<MyOpacity> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.2,
                duration: const Duration(milliseconds: 500),
                child: InteractiveViewer(
                    child: Image.network(
                        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'))),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              child: const Text("Toggle Opacity"),
            ),
          ],
        ),
      ),
    );
  }
}
