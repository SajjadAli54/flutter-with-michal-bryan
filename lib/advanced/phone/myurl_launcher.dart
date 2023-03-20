import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class MyUrlLauncher extends StatefulWidget {
  const MyUrlLauncher({super.key});

  @override
  State<MyUrlLauncher> createState() => _MyUrlLauncherState();
}

class _MyUrlLauncherState extends State<MyUrlLauncher> {
  void _showUrl() async {
    // _launch("http://sajjadali.netlify.app/");
    const url = 'https://blog.logrocket.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'khaskhelisajjadali6@gmail.com',
      query: 'subject=Example Email&body=This is an example email',
    );

    _launch(uri.toString());
  }

  void _showPhone() {
    _launch("tel:03402689270");
  }

  void _showSms() {
    _launch("sms:03402689270");
  }

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
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
                onPressed: () => _showUrl(), child: const Text('Open Google')),
            ElevatedButton(
                onPressed: () => _showEmail(), child: const Text('Send Email')),
            ElevatedButton(
                onPressed: _showPhone, child: const Text('Call Phone')),
            ElevatedButton(onPressed: _showSms, child: const Text('Send SMS')),
          ],
        ),
      ),
    );
  }
}
