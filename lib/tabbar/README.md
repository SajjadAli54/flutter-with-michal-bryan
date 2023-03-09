# Tab Bar flutter

```dart
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Choice> choices = const <Choice>[
    Choice(title: 'CAR', icon: Icons.directions_car),
    Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    Choice(title: 'BOAT', icon: Icons.directions_boat),
    Choice(title: 'BUS', icon: Icons.directions_bus),
    Choice(title: 'TRAIN', icon: Icons.directions_railway),
    Choice(title: 'WALK', icon: Icons.directions_walk),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: choices.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('TabBar'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(secondary: Colors.white)),
                  child: Container(
                      height: 48.0,
                      alignment: Alignment.center,
                      child: TabPageSelector(
                        controller: _tabController,
                      ))))),
      body: TabBarView(
        controller: _tabController,
        children: choices
            .map((Choice choice) => Container(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(choice.title),
                        const SizedBox(height: 10.0),
                        Icon(choice.icon, size: 120.0)
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({required this.title, required this.icon});
}

```
