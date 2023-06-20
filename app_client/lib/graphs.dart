import 'dart:async';
// import 'dart:ffi';
import 'dart:io';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/material.dart';

class Graphs extends StatefulWidget {
  final List<dynamic> datalist;

  const Graphs({Key? key, required this.datalist}) : super(key: key);

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {
    print(widget.datalist);
    List<_SensorData> data = [
      _SensorData('1', 35, 40, 27),
      _SensorData('2', 36, 41, 28),
      _SensorData('3', 37, 42, 29),
      _SensorData('4', 38, 43, 30),
      _SensorData('5', 39, 44, 31),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphs'),
      ),
      body: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Accelerometer Data Analysis'),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_SensorData, String>>[
              LineSeries<_SensorData, String>(
                dataSource: data,
                xValueMapper: (_SensorData data, _) => data.time,
                yValueMapper: (_SensorData data, _) => data.x,
                name: 'Accelerometer-X',
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
              LineSeries<_SensorData, String>(
                dataSource: data,
                xValueMapper: (_SensorData data, _) => data.time,
                yValueMapper: (_SensorData data, _) => data.y,
                name: 'Accelerometer-Y',
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
              LineSeries<_SensorData, String>(
                dataSource: data,
                xValueMapper: (_SensorData data, _) => data.time,
                yValueMapper: (_SensorData data, _) => data.z,
                name: 'Accelerometer-Z',
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SensorData {
  final String time;
  final double x;
  final double y;
  final double z;

  _SensorData(this.time, this.x, this.y, this.z);
}
