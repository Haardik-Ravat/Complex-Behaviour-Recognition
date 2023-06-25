import 'package:flutter/material.dart';

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
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'Add Activity',
              ),
              onSubmitted: (text) {
                _addOption(text);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                bool isSelected = false; // track the selected state of the option
                return ListTile(
                  // tileColor: isSelected ? Colors.blue : null, // change color if selected
                  title: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (bool? val) {
                          print("hi");
                          setState(() {
                            isSelected = val!;
                          });
                        },
                      ),
                      Text(options[index]),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removeOption(options[index]);
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('Generate CSV'),
            onPressed: _csvoption,
          ),
        ],
      ),
    );
  }
}
