import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/my_app.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}