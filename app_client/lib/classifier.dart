import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  // name of the model file
  final _modelPath = 'assets/modelhar1.tflite';
  // Maximum length of sentenc

  final String start = '<START>';
  final String pad = '<PAD>';
  final String unk = '<UNKNOWN>';

  // TensorFlow Lite Interpreter object
  late Interpreter? _interpreter;
  late Tensor? _inputTensor;
  late Tensor? _outputTensor;

  Classifier() {
    // Load model when the classifier is initialized.
    _loadModel();
  }

  Future<void> _loadModel() async {
    final options = InterpreterOptions();
    // if (Platform.isAndroid) {
    //   options.addDelegate(XNNPackDelegate());
    // }
    _interpreter = await Interpreter.fromAsset(_modelPath, options: options);

    print(_interpreter);
    print('Interpreter loaded successfully');
  }

  int classify(List<dynamic> inpdata) {
    // tokenizeInputText returns List<List<double>>
    // of shape [1, 256].
    List<dynamic> input = inpdata;

    // output of shape [1,2].
    var output = 2;
    print("fdfd");

    // The run method will run inference and
    // store the resulting values in output.
    _interpreter?.run(input, output);
    print(output);

    return 2;
  }
}
