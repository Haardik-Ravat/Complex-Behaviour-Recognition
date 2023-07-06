import 'package:flutter/material.dart';
import 'globals.dart' as g;
import 'package:tflite/tflite.dart';

class ActivityRecog extends StatefulWidget {
  const ActivityRecog({Key? key}) : super(key: key);

  @override
  State<ActivityRecog> createState() => _ActivityRecogState();
}

class _ActivityRecogState extends State<ActivityRecog> {




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
