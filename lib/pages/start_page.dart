import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/style/app_color.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/temp/logo.svg',
                width: 200,
              ),
              Text(
                'NECO',
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w900,
                  color: AppColor.font2,
                ),
              ),
              const Spacer(),
              Text(
                'Hey! Welcome',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColor.button2,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                textAlign:TextAlign.center,
                'While you sit and stay - we\'ll go out and play',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.font2,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: (){
              
                  },
                  label: SvgPicture.asset('assets/icon/alt-arrow-right.svg'),
                  icon: Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.button2,
                    foregroundColor: AppColor.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColor.font2,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.button2,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ]
          ),
        ),
      ),
    );
  }
}
