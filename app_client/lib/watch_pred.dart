import 'package:flutter/material.dart';
import 'globals.dart' as gl;

class Watch_Pred extends StatefulWidget {
  const Watch_Pred({Key? key}) : super(key: key);

  @override
  State<Watch_Pred> createState() => _Watch_PredState();
}

class _Watch_PredState extends State<Watch_Pred> {



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Stream Value Display'),
      // ),

      body: Center(
        child: StreamBuilder<List<dynamic>>(
          stream: gl.datalistStream,
          builder: (context, snapshot) {
            print(gl.datalist);


            // if (snapshot.hasData) {
            //   final lastValue = snapshot.data;
            //   List l=[1,2];
            //   gl.updateDatalist(l);
              return Text(
                gl.datalist.last.toString()
              );
            // } else {
            //   return CircularProgressIndicator();
            // }

          },
        ),
      ),
    );
  }
}
