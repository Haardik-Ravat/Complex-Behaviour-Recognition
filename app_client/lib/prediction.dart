import 'dart:html';

import 'package:flutter/material.dart';
import 'globals.dart' as g;
import 'package:tflite/tflite.dart';

class ActivityRecog extends StatefulWidget {
  const ActivityRecog({Key? key}) : super(key: key);

  @override
  State<ActivityRecog> createState() => _ActivityRecogState();
}

class _ActivityRecogState extends State<ActivityRecog> {

var tflite=0;
//
// @override
// void initState() {
//   super.initState();
//   _loading = true;
//
//   loadModel().then((value) {
//     setState(() {
//       _loading = false;
//     });
//   });
// }
//
//
// classifyImage(File image) async {
//   var output = await Tflite.runModelOnImage(
//     path: image.path,
//     numResults: 2,
//     threshold: 0.5,
//     imageMean: 127.5,
//     imageStd: 127.5,
//   );
//   setState(() {
//     _loading = false;
//     _outputs = output;
//   });
// }
//
// loadModel() async {
//   await Tflite.loadModel(
//     model: "assets/model_unquant.tflite",
//     labels: "assets/labels.txt",
//   );
// }
// @override
// void dispose() {
//   Tflite.close();
//   super.dispose();
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AppBar Demo'),
      //
      // ),
      body:
      Center(
        child: Column(
        children: [
          Image.asset('/menhera-chan-chibi.gif'),
          SizedBox(
            height: 20,
          ),
          Text(
          'This is the activity recog page',
          style: TextStyle(fontSize: 24),
        ),
          SizedBox(
            height: 20,
          ),

          ElevatedButton(onPressed: (){

          },

              child: Text("Predict current data"))



      ],),
      )
    );
  }
}
