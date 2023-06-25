import 'package:flutter/material.dart';
import 'package:wear_os/main.dart';
import 'package:wear_os/pongsense.dart';
import 'package:wear_os/recog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
      appBar: AppBar(
          title: const Text('Complex Behaviour Recognition'),
        bottom: const TabBar(
          tabs: [
            Tab(
              text: 'SmartWatch ',
            ),
            Tab(
              text: 'Esense',
            ),
            Tab(
              text: 'Data',
            ),
          ],
        ),
      ),
      body: const TabBarView(
        children: <Widget>[
         MyApp(),
          PongSense(),
Recog()

        ],
      )
        )
    );
  }
}
