import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/auth/routs/my_app.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}