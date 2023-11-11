import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../style/view_style.dart';

class Verification {
  static AppBar numberVerif() {
    return AppBar(
      backgroundColor: AppColor.button2,
      foregroundColor: AppColor.font1,
      title: Text(
        'NECO',
        style: AppFont.header1,
      ),
      centerTitle: true,
    );
  }

  static LayoutBuilder layoutVerif(String phone, String text1, String route,) {
    return LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          text1,
                          style: TextStyle(
                            color: AppColor.button2,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'We will send you a text with a verification code',
                          style: TextStyle(
                            color: AppColor.font2,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        style: TextStyle(
                          color: AppColor.font1,
                          fontSize: 18,
                        ),
                        cursorColor: AppColor.font1,
                        decoration: InputDecoration(
                          hintText: '+7 000 000 00 00',
                          hintStyle: TextStyle(color: AppColor.font1),
                          filled: true,
                          fillColor: AppColor.font2,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: AppColor.button2),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 14.0),
                        ),
                        maxLength: 14,
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[0-9+]+'))
                        ],
                        onChanged: (value) {
                          phone = value;
                        },
                        validator: (value) {
                          if (phone.length > 14 && phone.length < 10) {
                            return 'Enter your phone number';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (phone.length <= 14 && phone.length >= 10) {
                              Navigator.pushNamed(context, '/code', arguments: {'phone': phone, 'routes': route},);
                            }
                          },
                          child: Text(
                            'Next',
                            style: AppFont.header2,
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.font1,
                            backgroundColor: AppColor.button2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            )
          )
        );
  }
  
}
