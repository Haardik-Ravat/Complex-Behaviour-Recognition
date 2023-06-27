import 'package:flutter/material.dart';
import 'globals.dart' as g;


class Recog extends StatefulWidget {
  const Recog({Key? key}) : super(key: key);

  @override
  State<Recog> createState() => _RecogState();
}

class _RecogState extends State<Recog> {
  TextEditingController _textFieldController = TextEditingController();
  List<String> options = [];

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _addOption(String text) {
    setState(() {
      options.add(text);
      _textFieldController.clear();
    });
  }

  void _removeOption(String text) {
    setState(() {
      options.remove(text);
    });
  }

  void _csvoption() {
    print(options); // Replace this with your desired action
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
          Text("Currently Selected Activity:",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(g.currentActivity,
            style: TextStyle(fontWeight: FontWeight.w300),),
SizedBox(height: 20,),
          Text("Click the checkbox to Select Activity",
            style: TextStyle(fontWeight: FontWeight.w500),),

          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                bool isSelected = false; // track the selected state of the option
                return ListTile(
                  // tileColor: isSelected ? Colors.blue : null, // change color if selected
                  title:

                  Row(

                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? val) {
                          setState(() {
                            g.currentActivity=options[index];
                            isSelected = val!;
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
