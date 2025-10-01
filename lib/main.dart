import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  runApp(const App());
}
