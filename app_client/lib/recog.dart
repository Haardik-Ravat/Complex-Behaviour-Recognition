import 'package:flutter/material.dart';
import 'globals.dart' as g;

class Recog extends StatefulWidget {
  const Recog({Key? key}) : super(key: key);

  @override
  State<Recog> createState() => _RecogState();
}

class _RecogState extends State<Recog> {
  final TextEditingController _textFieldController = TextEditingController();
  List<String> options = [];
  int selectedIndex = -1;

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _addOption(String text) {
    setState(() {
      options.add(text);
      _textFieldController.clear();
      if (selectedIndex == -1) {
        g.currentActivity = text;
      }
    });
  }

  void _removeOption(String text) {
    setState(() {
      options.remove(text);
      if (g.currentActivity == text) {
        g.currentActivity = '';
      }
    });
  }

  void _csvoption() {
    // print(options); // Replace this with your desired action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                labelText: 'Add Activity',
              ),
              onSubmitted: (text) {
                _addOption(text);
              },
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            "Currently Selected Activity:",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            g.currentActivity,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Click the checkbox to Select Activity",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: selectedIndex == index ? Colors.blue : null,
                  title: Row(
                    children: [
                      Checkbox(
                        value: selectedIndex == index,
                        onChanged: (bool? val) {
                          setState(() {
                            selectedIndex = val! ? index : -1;
                            if (selectedIndex != -1) {
                              g.currentActivity = options[selectedIndex];
                            } else {
                              g.currentActivity = '';
                            }
                          });
                        },
                      ),
                      Text(options[index]),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _removeOption(options[index]);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          // ElevatedButton(
          //   child: const Text('Generate CSV'),
          //   onPressed: _csvoption,
          // ),
        ],
      ),
    );
  }
}
