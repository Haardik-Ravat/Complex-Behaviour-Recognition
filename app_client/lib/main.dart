import 'dart:async';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:is_wear/is_wear.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:watch_connectivity/watch_connectivity.dart';
import 'package:wear/wear.dart';

late final bool isWear;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  isWear = (await IsWear().check()) ?? false;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final WatchConnectivityBase _watch;

  // var _count = 0;

  var _supported = false;
  var _paired = false;
  var _reachable = false;
  // var _context = <String, dynamic>{};
  // var _receivedContexts = <Map<String, dynamic>>[];
  final _log = <String>[];

  Timer? timer;

  @override
  void initState() {
    super.initState();
    _watch = WatchConnectivity();
    _watch.messageStream
        .listen((e) => setState(() => _log.add('Data Received: $e')));
    initPlatformState();
  }

  void initPlatformState() async {
    _supported = await _watch.isSupported;
    _paired = await _watch.isPaired;
    _reachable = await _watch.isReachable;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final home = Scaffold(
        appBar: AppBar(
          title: const Text('Complex Behaviour Recognition'),
        ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Supported: $_supported'),
                Text('Paired: $_paired'),
                Text('Reachable: $_reachable'),
                TextButton(
                  onPressed: initPlatformState,
                  child: const Text('Refresh'),
                ),
                const SizedBox(height: 8),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(
                //       onPressed: sendMessage,
                //       child: const Text('Send Message'),
                //     ),
                //   ],
                // ),
                // TextButton(
                //   onPressed: toggleBackgroundMessaging,
                //   child: Text(
                //     '${timer == null ? 'Start' : 'Stop'} background messaging',
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                // const SizedBox(width: 16),
                const Text('Received Data:'),
                ..._log.reversed.map(Text.new),
                // TextButton(
                //   onPressed: initPlatformState,
                //   child: const Text('Get CSV'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );

    return MaterialApp(
      home: isWear
          ? AmbientMode(
              builder: (context, mode, child) => child!,
              child: home,
            )
          : home,
    );
  }

//   void sendMessage() {
//     final message = {'Gyro X': '0','Gyro Y': '0','Gyro Z': '0','Accel X': '0','Accel Y': '0','Accel Z': '0'};
//     if(_reachable==true){
//     _watch.sendMessage(message);
//     setState(() => _log.add('Data: $message'));
//   }}
//
//   // void sendContext() {
//   //   _count++;
//   //   final context = {'data': _count};
//   //   _watch.updateApplicationContext(context);
//   //   setState(() => _log.add('Sent context: $context'));
//   // }
//
//   void toggleBackgroundMessaging() {
//     if (timer == null) {
//       timer = Timer.periodic(const Duration(seconds: 1), (_) => sendMessage());
//     } else {
//       timer?.cancel();
//       timer = null;
//     }
//     setState(() {});
//   }
//   void convertAndSaveToCSV(Map<String, dynamic> data) async {
//
//     List<List<dynamic>> csvData = [
//       // data.keys.toList(),
//       data.values.toList()
//     ];
//
//     String csvString = const ListToCsvConverter().convert(csvData);
//     Directory? directory = await getExternalStorageDirectory();
//
//     if (directory != null) {
//       File file = File('${directory.path}/file.csv');
//       await file.writeAsString(csvString);
//       OpenFile.open(file.path);
//     }
//     else{
//       print("Error saving");
//     }
//   }



}
