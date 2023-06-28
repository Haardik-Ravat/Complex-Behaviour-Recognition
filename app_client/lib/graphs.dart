import 'dart:async';

import 'dart:io';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Graphs extends StatefulWidget {
  const Graphs({Key? key}) : super(key: key);

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {
    // print(globals.datalist);
    // print(globals.times);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphs'),
      ),
      body: Column(
        children: [
          StreamBuilder<List<dynamic>>(
            stream: globals.datalistStream,
            builder: (context, snapshot) {
              print("hehehehe");
              print(snapshot.data);
              print(snapshot.hasData);
              // return Text("helelele");
              if (snapshot.hasData && snapshot.data!.length >= 2) {
                final List<dynamic> updatedData = snapshot.data!;
                // print(updatedData);
                // print(globals.times);
                // List<_SensorData> data = [];
                // for (var i = 0; i < updatedData.length; i++) {
                //   data.add(_SensorData(
                //       (globals.times[i] - globals.times[0]).toString(),
                //       updatedData[i][0],
                //       updatedData[i][1],
                //       updatedData[i][2]));
                // }

                // List<_SensorData> data1 = [];
                // for (var i = 0; i < updatedData.length; i++) {
                //   data1.add(_SensorData(
                //       (globals.times[i] - globals.times[0]).toString(),
                //       updatedData[i][3],
                //       updatedData[i][4],
                //       updatedData[i][5]));
                // }

                List<_SensorData> data = [
                  _SensorData(
                      (globals.times[globals.times.length - 5] -
                              globals.times[0])
                          .toString(),
                      updatedData[updatedData.length - 5][0],
                      updatedData[updatedData.length - 5][1],
                      updatedData[updatedData.length - 5][2]),
                  _SensorData(
                      (globals.times[globals.times.length - 4] -
                              globals.times[0])
                          .toString(),
                      updatedData[updatedData.length - 4][0],
                      updatedData[updatedData.length - 4][1],
                      updatedData[updatedData.length - 4][2]),
                  _SensorData(
                      (globals.times[globals.times.length - 3] -
                              globals.times[0])
                          .toString(),
                      updatedData[updatedData.length - 3][0],
                      updatedData[updatedData.length - 3][1],
                      updatedData[updatedData.length - 3][2]),
                  _SensorData(
                      (globals.times[globals.times.length - 2] -
                              globals.times[0])
                          .toString(),
                      updatedData[updatedData.length - 2][0],
                      updatedData[updatedData.length - 2][1],
                      updatedData[updatedData.length - 2][2]),
                  _SensorData(
                      (globals.times[globals.times.length - 1] -
                              globals.times[0])
                          .toString(),
                      updatedData[updatedData.length - 1][0],
                      updatedData[updatedData.length - 1][1],
                      updatedData[updatedData.length - 1][2])
                ];
                List<_SensorData> data1 = [
                  _SensorData(
                      globals.times[globals.times.length - 5].toString(),
                      updatedData[updatedData.length - 5][3],
                      updatedData[updatedData.length - 5][4],
                      updatedData[updatedData.length - 5][5]),
                  _SensorData(
                      globals.times[globals.times.length - 4].toString(),
                      updatedData[updatedData.length - 4][3],
                      updatedData[updatedData.length - 4][4],
                      updatedData[updatedData.length - 4][5]),
                  _SensorData(
                      globals.times[globals.times.length - 3].toString(),
                      updatedData[updatedData.length - 3][3],
                      updatedData[updatedData.length - 3][4],
                      updatedData[updatedData.length - 3][5]),
                  _SensorData(
                      globals.times[globals.times.length - 2].toString(),
                      updatedData[updatedData.length - 2][3],
                      updatedData[updatedData.length - 2][4],
                      updatedData[updatedData.length - 2][5]),
                  _SensorData(
                      globals.times[globals.times.length - 1].toString(),
                      updatedData[updatedData.length - 1][3],
                      updatedData[updatedData.length - 1][4],
                      updatedData[updatedData.length - 1][5])
                ];

                return SingleChildScrollView(
                    child: Column(
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
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      title: ChartTitle(text: 'Gyroscopic Data Analysis'),
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_SensorData, String>>[
                        LineSeries<_SensorData, String>(
                          dataSource: data1,
                          xValueMapper: (_SensorData data1, _) => data1.time,
                          yValueMapper: (_SensorData data1, _) => data1.x,
                          name: 'Gyroscopic-X',
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                        LineSeries<_SensorData, String>(
                          dataSource: data1,
                          xValueMapper: (_SensorData data1, _) => data1.time,
                          yValueMapper: (_SensorData data1, _) => data1.y,
                          name: 'Gyroscopic-Y',
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                        LineSeries<_SensorData, String>(
                          dataSource: data1,
                          xValueMapper: (_SensorData data1, _) => data1.time,
                          yValueMapper: (_SensorData data1, _) => data1.z,
                          name: 'Gyroscopic-Z',
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ],
                ));

                // return Container();
              } else if (snapshot.hasError) {
                return Text('Err: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('No data found');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
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
