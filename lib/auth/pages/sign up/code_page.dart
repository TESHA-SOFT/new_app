import 'package:flutter/material.dart';
import 'package:new_app/auth/components/verification_app.dart';

class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Verification.numberVerif(),
    );
  }
}