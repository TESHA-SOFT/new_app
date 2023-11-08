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

  static Column numberVerifi(String text, String rout, BuildContext context, String phone) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$text \nEnter your mobile number',
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
            hintText: '8 000 000 00 00',
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
            contentPadding: EdgeInsets.symmetric(horizontal: 14.0),
          ),
          maxLength: 11,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            phone = value;
          },
          validator: (value) {
            if(phone.length != 11){
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
              if(phone.length == 11){
                Navigator.of(context).pushNamed(rout);
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
    );
  }
}
