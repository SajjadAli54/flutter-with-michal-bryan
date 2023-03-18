import 'package:flutter/material.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class MyPermissions extends StatefulWidget {
  const MyPermissions({super.key});

  @override
  State<MyPermissions> createState() => _MyPermissionsState();
}

class _MyPermissionsState extends State<MyPermissions> {
  late String status;
  late Permission permission;

  @override
  void initState() {
    super.initState();
    status = 'Select an item';
    permission = Permission.contacts;

    for (var element in Permission.values) {
      debugPrint('Permission: ${element.toString()}');
    }
  }

  void _checkPermission() {}

  void _requestPermission() {}

  void _getStatus() {}

  void _openSettings() {}
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Permission Status: $status'),
              ElevatedButton(
                onPressed: _checkPermission,
                child: const Text('Check Permission'),
              ),
              ElevatedButton(
                onPressed: _requestPermission,
                child: const Text('Request Permission'),
              ),
              ElevatedButton(
                  onPressed: _getStatus, child: const Text('Get Status')),
              ElevatedButton(
                onPressed: _openSettings,
                child: const Text('Open Settings'),
              ),
            ],
          ),
        ));
  }
}
