import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/style/app_color.dart';
import 'package:new_app/style/app_font.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool toggle = false;
  bool isobscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset('assets/temp/logo.svg', width: 100,),
                const Spacer(),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    color: AppColor.font2,
                  ),
                ),
                const Spacer(),
                Text(
                  textAlign:TextAlign.center,
                  'By signing up, you agree to our',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColor.font2,
                  ),
                ),
                TextButton(
                  onPressed: (){
        
                  },
                  child: Text(
                    textAlign:TextAlign.center,
                    'Term and privacy policy',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColor.button2,
                    ),
                  ), 
                ),
                const Spacer(),
                TextFormField(
                  style: TextStyle(color: AppColor.font2),
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    hintStyle: TextStyle(color: AppColor.font2),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.button1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.font2)
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
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
                      }, 
                      icon: SvgPicture.asset('assets/icon/question.svg'),
                      label: Text(
                        'Forget password',
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
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      print('Login');
                    }, 
                    child: Text(
                      'Login',
                      style: AppFont.header2,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.button2,
                      foregroundColor: AppColor.font2,
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
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColor.button2,
                      child: IconButton(
                        onPressed: (){
                        }, 
                        icon: Image.asset('assets/temp/google.png'),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColor.button2,
                      child: IconButton(
                        onPressed: (){
                        }, 
                        icon: Image.asset('assets/temp/vk.png'),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColor.button2,
                      child: IconButton(
                        onPressed: (){
                        }, 
                        icon: Image.asset('assets/temp/yandex.png'),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}