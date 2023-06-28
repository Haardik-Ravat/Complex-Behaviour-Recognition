library globals;

import 'dart:async';

String currentActivity = "Not Selected";

String devicenm = "random";

List<dynamic> times = [];
List<dynamic> datalist = [];

List<dynamic> datalistesense = [];

StreamController<List<dynamic>> _datalistStreamController =
    StreamController<List<dynamic>>.broadcast();
Stream<List<dynamic>> get datalistStream => _datalistStreamController.stream;

void updateDatalist(List<dynamic> newData) {
  datalist.add(newData);
  _datalistStreamController.add(datalist);
}

void dispose() {
  _datalistStreamController.close();
}
