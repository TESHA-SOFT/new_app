import 'package:flutter/material.dart';
import 'package:new_app/pages/login_page.dart';
import 'package:new_app/pages/start_page.dart';
import 'package:new_app/style/app_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        fontFamily: 'Nunito',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => const StartPage(),
        '/login':(context) => const LoginPage(),
      },
    );
  }
}