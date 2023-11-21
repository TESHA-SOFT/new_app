import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/view_components.dart';
import '../../style/view_style.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool toggle = false;
  bool isobscureText = true;
  bool isobscureText1 = true;
  String? _password = '';
  String? _confirmPassword = '';
  RegExp emailRegax = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
  late bool isEmailValid;
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signUp() async {
    final isValid = _formkey.currentState!.validate();
    if(!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.button2,
          ),
        );
      }
    );

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context).pushNamed('/verif_ph').then((_){
          FirebaseAuth.instance.currentUser?.delete();
          Navigator.pop(context);
        }
      );
    }
    on FirebaseAuthException catch(e){
      Navigator.pop(context);
      Utils.showSnackBar(e.message);
    }

    //Navigator.of(context).pushReplacementNamed('/verif_ph');
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => 
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Form(
                  key: _formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        SvgPicture.asset('assets/temp/logo.svg', width: 90,),
                        const Spacer(),
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                            color: AppColor.font2,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          textAlign: TextAlign.center,
                          'By signing up, you agree to our',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColor.font2,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Term and privacy policy',
                              style: TextStyle(
                                height: 0.5,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColor.button2,
                              ),
                            )),
                        const Spacer(),
                        TextFormField(
                          style: TextStyle(color: AppColor.font2),
                          decoration: DecorationLogApp().decor('User name'),
                          validator: (value) => ValidApp().validateUsername(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(color: AppColor.font2),
                          decoration: DecorationLogApp().decor('Email address'),
                          onChanged: (value){
                            isEmailValid = emailRegax.hasMatch(value);
                          },
                          validator: (value) => ValidApp().validateEmail(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: isobscureText,
                          style: TextStyle(color: AppColor.font2),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: AppColor.font2),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.button1)),
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
                          validator: (value) => ValidApp().validatePassword(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: isobscureText1,
                          style: TextStyle(color: AppColor.font2),
                          decoration: InputDecoration(
                            hintText: 'Confirm password',
                            hintStyle: TextStyle(color: AppColor.font2),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.button1)),
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
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              signUp();
                              /*if(_formkey.currentState!.validate()){
                                Navigator.of(context).pushNamed('/verif_ph');
                              }*/
                            }, 
                            child: Text(
                              'Sign up',
                              style: AppFont.header2,
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: AppColor.font2,
                              backgroundColor: AppColor.button2,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'or connect with',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.font2,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DecorationLogApp().emailButton('assets/temp/google.png'),
                            DecorationLogApp().emailButton('assets/temp/vk.png'),
                            DecorationLogApp().emailButton('assets/temp/yandex.png'),
                          ],
                        ),
                        const Spacer(),
                      ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
