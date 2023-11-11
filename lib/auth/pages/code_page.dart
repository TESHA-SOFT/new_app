import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/auth/components/verification_app.dart';
import 'package:new_app/auth/style/view_style.dart';
import 'package:pinput/pinput.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  bool _isResendAgain = false;
  String _code = '';
  late Timer _timer;
  int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const onSec = Duration(seconds: 1);
    _timer = Timer.periodic(onSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? '')
        as Map<String, dynamic>;

    return Scaffold(
      appBar: Verification.numberVerif(),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
              padding: EdgeInsets.all(15),
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start, 
                  children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter code',
                      style: TextStyle(
                        color: AppColor.button2,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Code sent to you mobile number \n${arguments['phone']}',
                      style: TextStyle(
                        color: AppColor.font2,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Pinput(
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.center,
                    defaultPinTheme: PinTheme(
                      textStyle: TextStyle(
                          color: AppColor.font1,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColor.font2,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      _code = value;
                    },
                    validator: (value) {
                      if (value == '555555') {
                        Navigator.of(context).pushNamed(arguments['routes']);
                      } else {
                        return 'Invalid code';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  OverflowBar(
                    overflowAlignment: OverflowBarAlignment.center,
                    children: [
                      Text(
                        'Don\'t resive the OTP?',
                        style: TextStyle(
                          color: AppColor.font2,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            if (_isResendAgain) return;
                            resend();
                          },
                          child: Text(
                            _isResendAgain
                                ? 'Try again in ' + _start.toString()
                                : 'Resend',
                            style: TextStyle(
                              color: AppColor.button2,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ],
                  ),
                  const Spacer(),
              ]),
            )),
          ),
        ),
      ),
    );
  }
}
