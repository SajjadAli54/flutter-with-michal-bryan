import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  final ValueChanged<bool> onAuthenticationChanged;

  const Authenticator({super.key, required this.onAuthenticationChanged});

  @override
  State<Authenticator> createState() =>
      // ignore: no_logic_in_create_state
      _AuthenticatorState(onAuthenticated: onAuthenticationChanged);
}

class _AuthenticatorState extends State<Authenticator> {
  late TextEditingController _user;
  late TextEditingController _pass;
  final ValueChanged<bool> onAuthenticated;

  _AuthenticatorState({required this.onAuthenticated});

  @override
  void initState() {
    super.initState();
    _user = TextEditingController();
    _pass = TextEditingController();
  }

  void onPressed() {
    if (_user.text != "user" && _pass.text != "pass123") {
      onAuthenticated(false);
    } else {
      onAuthenticated(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _user,
                decoration: const InputDecoration(
                  labelText: "User",
                  hintText: "Enter your user name",
                ),
              ),
              TextField(
                controller: _pass,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                ),
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: const Text("Login"),
              ),
            ],
          )),
    );
  }
}
