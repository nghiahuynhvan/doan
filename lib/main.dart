import 'package:flutter/material.dart';

import 'app.dart';
import 'initializer.dart';

void main() async {
  Initializer.instance.init(() {
    runApp(App());
  });
}

