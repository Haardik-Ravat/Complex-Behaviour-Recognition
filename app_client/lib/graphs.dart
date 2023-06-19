import 'dart:async';
import 'dart:io';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphs'),
      ), //AppBar
      body: const Center(
        child: Text(
          'Page for graphs',

        ), //Text
      ),
    );
  }
}
