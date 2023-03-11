import 'package:flutter/material.dart';
import 'package:flutter_bryan/authenticator/authenticator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _isAuthenticated = false;

  void onAuthenticationChanged(bool isAuthenticated) {
    setState(() {
      _isAuthenticated = isAuthenticated;
    });
  }

  @override
  void initState() {
    super.initState();
    _isAuthenticated = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Authenticator(onAuthenticationChanged: onAuthenticationChanged),
            if (_isAuthenticated)
              const Text("You are authenticated")
            else
              const Text("You are not authenticated")
          ],
        ),
      ),
    );
  }
}
