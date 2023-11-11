import 'package:flutter/material.dart';
import '../../components/view_components.dart';

class ForgorPassword extends StatefulWidget {
  const ForgorPassword({super.key});

  @override
  State<ForgorPassword> createState() => _ForgorPasswordState();
}

class _ForgorPasswordState extends State<ForgorPassword> {
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Verification.numberVerif(),
      body: Verification.layoutVerif(phone, 'Forgot your password?\nEnter your mobile number', '/reset_pas'),
    );
  }
}
