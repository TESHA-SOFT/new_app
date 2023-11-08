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
      body: LayoutBuilder(
        builder: (context, constraints) =>
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Verification.numberVerifi('Phone verification', '/code', context, phone),
              ) 
            ), 
          ),
        )
      ),
    );
  }
}