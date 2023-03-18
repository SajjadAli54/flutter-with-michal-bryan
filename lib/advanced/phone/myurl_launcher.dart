import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class MyUrlLauncher extends StatefulWidget {
  const MyUrlLauncher({super.key});

  @override
  State<MyUrlLauncher> createState() => _MyUrlLauncherState();
}

class _MyUrlLauncherState extends State<MyUrlLauncher> {
  void _showUrl() {
    _launch("https://sajjadali.netlify.app/");
  }

  void _showEmail() {
    _launch("mailto:khaskhelisajjadali6@gmail.com?subject=Hello&body=Hi");
  }

  void _showPhone() {
    _launch("tel:340-268-9270");
  }

  void _showSms() {
    _launch("sms:340-268-9270");
  }

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _showUrl, child: const Text('Open Google')),
            ElevatedButton(
                onPressed: _showEmail, child: const Text('Send Email')),
            ElevatedButton(
                onPressed: _showPhone, child: const Text('Call Phone')),
            ElevatedButton(onPressed: _showSms, child: const Text('Send SMS')),
          ],
        ),
      ),
    );
  }
}
