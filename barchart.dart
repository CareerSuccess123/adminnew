import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class barchart extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<DepData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        title: ChartTitle(text: 'Bar Chart'),
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          BarSeries<DepData, String>(
              name: 'No of students applied',
              dataSource: _chartData,
              xValueMapper: (DepData number, _) => number.department,
              yValueMapper: (DepData number, _) => number.number,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
      ),
    ));
  }

  List<DepData> getChartData() {
    final List<DepData> chartData = [
      DepData('CSE', 40),
      DepData('IT', 32),
      DepData('ECE', 29),
      DepData('EEE', 23),
      DepData('ME', 23),
      DepData('CE', 23),
    ];
    return chartData;
  }
}

class DepData {
  DepData(this.department, this.number);
  final String department;
  final double number;
}
