import 'package:flutter/material.dart';
import '../../components/view_components.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Verification.numberVerif(),
      body: Verification.layoutVerif(phone,'Phone verification\nEnter your mobile number', '/main_page'),
    );
  }
}
