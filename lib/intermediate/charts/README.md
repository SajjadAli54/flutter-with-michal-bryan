# Flutter Charts

Add flutter_charts dependency in pubspec.yaml

## Code

```dart
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class MyChartsDemo extends StatefulWidget {
  const MyChartsDemo({super.key});

  @override
  State<MyChartsDemo> createState() => _MyChartsDemoState();
}

class _MyChartsDemoState extends State<MyChartsDemo> {
  late List<Sales> _data;
  late List<charts.Series<Sales, String>> _chartsData;

  void _makeData() {
    _data = [];
    _chartsData = [];

    final random = Random();
    for (int i = 2016; i < 2023; i++) {
      _data.add(Sales('$i', random.nextInt(1000)));
    }

    final chartSeries = charts.Series<Sales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      fillPatternFn: (datum, index) => charts.FillPatternType.solid,
      displayName: "Sales",
      data: _data,
    );
    _chartsData.add(chartSeries);
  }

  @override
  void initState() {
    super.initState();
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          children: [
            const Text(
              'Sales',
              style: TextStyle(fontSize: 24.0),
            ),
            Expanded(
                child: charts.BarChart(
              _chartsData,
              animate: true,
              barGroupingType: charts.BarGroupingType.grouped,
              behaviors: [
                charts.SeriesLegend(
                  position: charts.BehaviorPosition.bottom,
                  horizontalFirst: false,
                  cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                  showMeasures: true,
                  measureFormatter: (num? value) {
                    return value == null ? '-' : '${value}M';
                  },
                ),
              ],
            )),
          ],
        )),
      ),
    );
  }
}

class Sales {
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}

```
