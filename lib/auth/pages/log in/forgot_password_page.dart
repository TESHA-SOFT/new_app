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
      body: LayoutBuilder(
        builder: (context, constraints) =>
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Verification.numberVerifi('Forgot your password?','/code', context, phone),
              )
            ),
          ),
        )
      ),
    );
  }
}