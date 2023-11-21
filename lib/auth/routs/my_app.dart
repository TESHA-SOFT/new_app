import 'package:flutter/material.dart';

import '../../main_pages/view_main_page.dart';
import '../components/view_components.dart';
import '../pages/view_pages.dart';
import '../style/view_style.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        fontFamily: 'Nunito',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => const StartPage(),
        '/login':(context) => const LoginPage(),
        '/signup':(context) => const SignupPage(),
        '/verif_ph':(context) => const PhoneVerification(),
        '/forgot_pas':(context) => const ForgorPassword(),
        '/code':(context) => const CodePage(),
        '/reset_pas':(context) => const ResetPassword(),
        '/main_page':(context) => const MainPage(),
        '/auth_page': (context) => const AuthPage(),
      },
    );
  }
}