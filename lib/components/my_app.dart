import 'package:flutter/material.dart';

import '../pages/view_pages.dart';
import '../style/view_style.dart';

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
        '/logup':(context) => const SignupPage(),
      },
    );
  }
}