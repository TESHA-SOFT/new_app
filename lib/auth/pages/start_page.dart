import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/view_style.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});

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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/temp/logo.svg',
                        width: (MediaQuery.of(context).size.width)/2,
                        height: (MediaQuery.of(context).size.height)/3,
                        fit: BoxFit.contain,
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
                      SizedBox(height: 7,),
                      Text(
                        textAlign:TextAlign.center,
                        'While you sit and stay - we\'ll go out and play',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColor.font2,
                        ),
                      ),
                      SizedBox(height: 10,),
                      const Spacer(),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: (){
                            Navigator.of(context).pushNamed('/signup');
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
                            foregroundColor: AppColor.font1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      OverflowBar(
                        overflowAlignment: OverflowBarAlignment.center,
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
                              Navigator.of(context).pushNamed('/auth_page');
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
            ),
          ),
        ),
      ),
    );
  }
}
