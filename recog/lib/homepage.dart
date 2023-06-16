import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:graphview/GraphView.dart';

class GraphActivity extends StatefulWidget {
  final String filePath;
  final List<String> activitySelected;

  GraphActivity({required this.filePath, required this.activitySelected});

  @override
  _GraphActivityState createState() => _GraphActivityState();
}

class _GraphActivityState extends State<GraphActivity> {
  GraphView? graph1, graph2;
  List<double> axList = [], ayList = [], azList = [], gxList = [], gyList = [], gzList = [];
  List<String> latList = [], longList = [];
  int rowCount = 0;

  @override
  void initState() {
    super.initState();
    _readCSVFile();
  }

  Future<void> _readCSVFile() async {
    String filePath = widget.filePath;
    List<List<dynamic>> csvData = [];
    try {
      String fileContent = await rootBundle.loadString(filePath);
      csvData = CsvToListConverter().convert(fileContent);
    } catch (e) {
      print(e);
    }

    setState(() {
      rowCount = csvData.length;

      // Initialize GraphView and set properties for Graph 1
      graph1 = GraphView(
        graphId: "graph1",
        horizontalAxisTitle: "Sample",
        verticalAxisTitle: "Acceleration",
        isScrollable: true,
        isScalable: true,
        backgroundColor: Colors.white,
      );

      // Initialize GraphView and set properties for Graph 2
      graph2 = GraphView(
        graphId: "graph2",
        horizontalAxisTitle: "Sample",
        verticalAxisTitle: "Gyro",
        isScrollable: true,
        isScalable: true,
        backgroundColor: Colors.white,
      );

      LineGraphSeries<DataPoint> axSeries = LineGraphSeries<DataPoint>();
      LineGraphSeries<DataPoint> aySeries = LineGraphSeries<DataPoint>();
      LineGraphSeries<DataPoint> azSeries = LineGraphSeries<DataPoint>();
      LineGraphSeries<DataPoint> gxSeries = LineGraphSeries<DataPoint>();
      LineGraphSeries<DataPoint> gySeries = LineGraphSeries<DataPoint>();
      LineGraphSeries<DataPoint> gzSeries = LineGraphSeries<DataPoint>();
      String tempActivityName = "";
      List<dynamic> tempRow = csvData[0];
      int gz1 = 0, timestamp = 0;
      for (int i = 0; i < tempRow.length; i++) {
        if (tempRow[i] == "GZ ") {
          gz1 = i;
        } else if (tempRow[i] == "Timestamp ") {
          timestamp = i;
        }
      }
      int number = timestamp - gz1 - 1;

      for (int i = 1; i < csvData.length; i++) {
        List<dynamic> row = csvData[i];
        String temp = "";
        int rowLength = row.length;
        if (rowLength < 7) {
          continue;
        }
        double x = i.toDouble();

        double ax = double.parse(row[1]);
        double ay = double.parse(row[2]);
        double az = double.parse(row[3]);
        axSeries.appendData(DataPoint(x, ax), true, csvData.length);
        aySeries.appendData(DataPoint(x, ay), true, csvData.length);
        azSeries.appendData(DataPoint(x, az), true, csvData.length);

        double gx = double.parse(row[4]);
        double gy = double.parse(row[5]);
        double gz = double.parse(row[6]);
        gxSeries.appendData(DataPoint(x, gx), true, csvData.length);
        gySeries.appendData(DataPoint(x, gy), true, csvData.length);
        gzSeries.appendData(DataPoint(x, gz), true, csvData.length);

        for (int j = 7; j < row.length - 1; j++) {
          temp = temp + row[j] + ", ";
        }
        temp = temp + row[row.length - 1];
        tempActivityName = temp;
      }
      String activityName = "";
      activityName = activityName + tempActivityName;

      graph1!.addSeries(axSeries);
      graph1!.addSeries(aySeries);
      graph1!.addSeries(azSeries);
      graph1!.title = "Activities: $activityName";

      graph2!.addSeries(gxSeries);
      graph2!.addSeries(gySeries);
      graph2!.addSeries(gzSeries);
      graph2!.title = "Activities: $activityName";
    });
  }

  Future<Uri> _getImageUri(BuildContext context, Image image) async {
    final ByteData byteData = await image.image.toByteData();
    final Uint8List imageData = byteData.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final file = await File('$tempPath/graph_image.jpg').writeAsBytes(imageData);
    return Uri.file(file.path);
  }

  void _shareGraphImages() async {
    if (graph1 == null || graph2 == null) return;
// Create Bitmaps of the graphs
    Image graph1Image = await graph1!.toImage();
    Image graph2Image = await graph2!.toImage();

// Create a list of URIs for the graph images
    List<Uri> imageUris = [];
    imageUris.add(await _getImageUri(context, graph1Image));
    imageUris.add(await _getImageUri(context, graph2Image));

// Create an Intent to share the graph images
    final AndroidIntent shareIntent = AndroidIntent(
      action: 'action_send_multiple',
      type: 'image/*',
      package: 'com.android.bluetooth',
      extraStreamUris: imageUris,
    );

    await shareIntent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph Activity'),
      ),
      body: Column(
        children: [
          Expanded(
            child: graph1 ?? Container(),
          ),
          Expanded(
            child: graph2 ?? Container(),
          ),
          ElevatedButton(
            onPressed: _shareGraphImages,
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}