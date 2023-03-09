# Expansion Panel flutter

```dart
import 'package:flutter/material.dart';

class MyExpansionPanel extends StatefulWidget {
  const MyExpansionPanel({super.key});

  @override
  State<StatefulWidget> createState() => _MyExpansionPanelState();
}

class _MyExpansionPanelState extends State<MyExpansionPanel> {
  List<MyItem> list = <MyItem>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      list.add(MyItem(
          false,
          'Item $i',
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Hello World'),
          )));
    }
  }

  ExpansionPanel createItem(MyItem item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              item.header,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expansion Panel'),
        ),
        body: Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) =>
                      setState(() {
                    list[index].isExpanded = !list[index].isExpanded;
                  }),
                  children: list.map(createItem).toList(),
                )
              ],
            )));
  }
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

```
