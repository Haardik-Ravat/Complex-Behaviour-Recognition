

void onSensorChanged(SensorEvent sensorEvent) {
  Sensor mySensor = sensorEvent.sensor;
  Sensor GSensor = sensorEvent.sensor;

  if (GSensor.type == Sensor.TYPE_GYROSCOPE) {
    double gx = sensorEvent.values[0];
    double gy = sensorEvent.values[1];
    double gz = sensorEvent.values[2];

    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if ((currentTime - lastUpdateGyro > 300)) {
      lastUpdateGyro = currentTime;

      GetNewLocation(); // Just to update the location ;P

      String sX = gx.toString();
      TextView text = findViewById(R.id.gx);
      text.text = sX;

      String sY = gy.toString();
      text = findViewById(R.id.gy);
      text.text = sY;

      String sZ = gz.toString();
      text = findViewById(R.id.gz);
      text.text = sZ;

      fileString = fileString + sX + ", " + sY + ", " + sZ + ", ";
    }
    FileWriters(fileString);
  }

  if (mySensor.type == Sensor.TYPE_ACCELEROMETER) {
    double x = sensorEvent.values[0];
    double y = sensorEvent.values[1];
    double z = sensorEvent.values[2];

    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if ((currentTime - lastUpdate) > 300) {
      int timeDiff = currentTime - lastUpdate;
      lastUpdate = currentTime;

      String sX = x.toString();
      TextView text = findViewById(R.id.ax);
      text.text = sX;

      String sY = y.toString();
      text = findViewById(R.id.ay);
      text.text = sY;

      String sZ = z.toString();
      text = findViewById(R.id.az);
      text.text = sZ;

      fileString = fileString + sX + ", " + sY + ", " + sZ + ", ";
      for (int i = 0; i < activitySelected.length - 1; i++) {
        fileString = fileString + activitySelected[i] + ", ";
      }
      fileString = fileString + activitySelected[activitySelected.length - 1] + ", ";
      DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
      String currentTimeString = formatter.format(DateTime.now());
      fileString = fileString + currentTimeString + "\n";
    }
    FileWriters(fileString);
  }
}

void onAccuracyChanged(Sensor sensor, int accuracy) {
  // Empty implementation
}

void switchAppearance() {
  List<String> tempActivities = [];
  Switch mySwitch = findViewById(R.id.sw);
  int cnt = 0;
  if (llButtons != null) {
    for (int i = 0; i < llButtons.children.length; i++) {
      View view = llButtons.children[i];
      if (view is ToggleButton) {
        ToggleButton toggleButton = view as ToggleButton;
        if (toggleButton.isChecked) {
          cnt++;
        }
      }
    }
  }

  if (cnt >= 1) {
    mySwitch.visibility = View.VISIBLE;
    String tempActivity = "";
    for (int i = 0; i < llButtons.children.length; i++) {
      View view = llButtons.children[i];
      if (view is ToggleButton) {
        ToggleButton toggleButton = view as ToggleButton;
        if (toggleButton.isChecked) {
          tempActivity = toggleButton.text.toString();
          tempActivities.add(tempActivity);
        }
      }
    }
    activitySelected = tempActivities;
  } else {
    mySwitch.setChecked(false);
    mySwitch.setVisibility(View.GONE);
  }
}
