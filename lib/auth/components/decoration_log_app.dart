import 'package:flutter/material.dart';

import '../style/view_style.dart';


class DecorationLogApp {
  InputDecoration decor(String text) {
    return InputDecoration(
      hintText: text,
      hintStyle: TextStyle(color: AppColor.font2),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: AppColor.button1)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.font2),
      ),
    );
  }

  CircleAvatar emailButton(String rout) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColor.button2,
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(rout),
      ),
    );
  }
}
