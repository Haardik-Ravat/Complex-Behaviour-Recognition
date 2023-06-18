import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';


class Graphs extends StatefulWidget {
  const Graphs({Key? key}) : super(key: key);

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {
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
