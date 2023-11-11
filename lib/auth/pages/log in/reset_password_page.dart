import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/auth/components/verification_app.dart';

import '../../style/view_style.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isobscureText = true;
  bool isobscureText1 = true;
  String? _password = '';
  String? _confirmPassword = '';
  final _formkey = GlobalKey<FormState>();

  Align resetAlign(String text, Color color, double fontSize ,FontWeight fontWeight){
    return Align(
      alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
           fontWeight: fontWeight,
          ),
        ),
      );
  }

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
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      resetAlign('Create new password', AppColor.button2, 25, FontWeight.w500),
                      SizedBox(height: 10,),
                      resetAlign('Please enter and confirm your new password', AppColor.font2, 18, FontWeight.w400),
                      SizedBox(height: 30,),
                      resetAlign('New password', AppColor.button2, 20, FontWeight.w500),
                      SizedBox(height: 5,),
                      TextFormField(
                        obscureText: isobscureText,
                        style: TextStyle(color: AppColor.font2),
                        decoration: InputDecoration(
                           hintText: 'Password',
                            hintStyle: TextStyle(color: AppColor.font2),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColor.button1)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.font2),
                            ),
                            suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  isobscureText = !isobscureText;
                                }
                                );
                              },
                              icon: isobscureText
                                  ? SvgPicture.asset('assets/icon/eye-closed.svg')
                                  : SvgPicture.asset('assets/icon/eye.svg'),
                            )
                        ),
                        onChanged: (value) {
                          _password = value;
                        },
                        validator: (value) {
                          if(_password!.length < 8){
                            return 'The password must be at least 8 characters long';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: 20,),
                      resetAlign('Confirm new password', AppColor.button2, 20, FontWeight.w500),
                      //SizedBox(height: 5,),
                      TextFormField(
                        obscureText: isobscureText1,
                        style: TextStyle(color: AppColor.font2),
                        decoration: InputDecoration(
                           hintText: 'Password',
                            hintStyle: TextStyle(color: AppColor.font2),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColor.button1)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.font2),
                            ),
                            suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  isobscureText1 = !isobscureText1;
                                }
                                );
                              },
                              icon: isobscureText1
                                  ? SvgPicture.asset('assets/icon/eye-closed.svg')
                                  : SvgPicture.asset('assets/icon/eye.svg'),
                            )
                        ),
                        onChanged: (value) {
                          _confirmPassword = value;
                        },
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'The password must be at least 8 characters long';
                          }
                          if (_confirmPassword != _password) {
                            return 'Confirm password not matching';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const Spacer(),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formkey.currentState!.validate()){
                              Navigator.of(context).pushNamed('/login');
                            }
                          }, 
                          child: Text(
                            'Reset password',
                            style: AppFont.header2,
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.font2,
                            backgroundColor: AppColor.button2,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ]
                  ),
                ),
              ) 
            ), 
          ),
        ) 
      ),
    );
  }
}