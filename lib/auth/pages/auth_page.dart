import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app/auth/pages/log%20in/login_page.dart';
import 'package:new_app/main_pages/main_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //logged in
          if(snapshot.hasData){
            return MainPage();
          }
          //not logged in
          else{
            return LoginPage();
          }
        }, 
      ),
    );
  }
}