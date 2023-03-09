import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class MyChartsGroupDemo extends StatefulWidget {
  const MyChartsGroupDemo({super.key});

  @override
  State<MyChartsGroupDemo> createState() => _MyChartsGroupDemoState();
}

class _MyChartsGroupDemoState extends State<MyChartsGroupDemo> {
  late List<Sales> _laptops;
  late List<Sales> _desktops;
  late List<charts.Series<Sales, String>> _chartsData;

  void _makeData() {
    _laptops = [];
    _desktops = [];
    _chartsData = [];

    final random = Random();
    for (int i = 2019; i <= 2023; i++) {
      _laptops.add(Sales(i.toString(), random.nextInt(100)));
      _desktops.add(Sales(i.toString(), random.nextInt(100)));
    }

    final laptopsSeries = charts.Series<Sales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      displayName: "Laptops",
      data: _laptops,
    );
    final desktopsSeries = charts.Series<Sales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      data: _desktops,
    );

    _chartsData.add(laptopsSeries);
    _chartsData.add(desktopsSeries);
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
