import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/view_components.dart';
import '../../style/view_style.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool toggle = false;
  bool isobscureText = true;
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async{
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim(),
      );
    }
    on FirebaseAuthException catch(e){
      print(e);

      Utils.showSnackBar(e.message);
    }

    Navigator.pop(context);
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
                      SvgPicture.asset('assets/temp/logo.svg', width: 100,),
                      const Spacer(),
                      Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColor.font2,
                        ),
                      ),
                      const Spacer(),
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: AppColor.font2),
                        decoration: DecorationLogApp().decor('Email address'),
                        /*validator:(value) => ValidApp().validateEmail(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,*/
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
                            borderSide: BorderSide(color: AppColor.button1)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.font2)
                          ),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,  
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                isobscureText = !isobscureText;
                              });
                            },
                            icon: isobscureText
                                ? SvgPicture.asset('assets/icon/eye-closed.svg')
                                : SvgPicture.asset('assets/icon/eye.svg'),
                          ),
                        ),
                        /*validator:(value) => ValidApp().validatePassword(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,*/
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 35,
                          child: TextButton.icon(
                            onPressed: (){
                              setState(() {
                                toggle = !toggle;
                              });
                            }, 
                            icon: toggle 
                              ? SvgPicture.asset('assets/icon/check-circle.svg')
                              : SvgPicture.asset('assets/icon/check-circle-full.svg'),
                            label: Text(
                              'Remember password',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColor.button2,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 35,
                          child: TextButton.icon(
                            onPressed: (){
                              Navigator.of(context).pushNamed('/forgot_pas');
                            }, 
                            icon: SvgPicture.asset('assets/icon/question.svg'),
                            label: Text(
                              'Forgot your password',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColor.button2,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: logIn,
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              /*if(_formkey.currentState!.validate()){
                                  Navigator.of(context).pushNamedAndRemoveUntil('/main_page', (route) => false);
                              }*/
                              logIn();
                            }, 
                            child: Text(
                              'Log in',
                              style: AppFont.header2,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: AppColor.button2,
                              foregroundColor: AppColor.font2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      OverflowBar(
                        overflowAlignment: OverflowBarAlignment.center,
                        children: [
                          Text(
                            'No account?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColor.font2,
                            ),
                            
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColor.button2,
                              ),
                              
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      //const Spacer(),
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