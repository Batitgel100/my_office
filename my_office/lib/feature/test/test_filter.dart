import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pie extends StatefulWidget {
  const Pie({super.key});

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, const Color.fromRGBO(9, 0, 136, 1)),
      ChartData('David', 2, const Color.fromARGB(255, 125, 125, 125)),
    ];
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCircularChart(annotations: <CircularChartAnnotation>[
      CircularChartAnnotation(
          widget: Container(
              child: PhysicalModel(
                  shape: BoxShape.circle,
                  elevation: 10,
                  shadowColor: Colors.black,
                  color: const Color.fromRGBO(230, 230, 230, 1),
                  child: Container()))),
      CircularChartAnnotation(
          widget: Container(
              child: const Text('5%',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25))))
    ], series: <CircularSeries>[
      DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          innerRadius: '80%',
          // Radius of doughnut
          radius: '30%')
    ]))));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
