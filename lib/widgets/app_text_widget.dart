import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Dimentions.dart';
import '../colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;
   AppTextField(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.icon,
      this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimentions.height20, right: Dimentions.height20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimentions.radius30/2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.2)),
          ]),
      child: TextField(
        obscureText: isObscure ? true :false ,
        controller: textController,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: Appcolors.maincolor,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.radius30/2),
                borderSide: BorderSide(width: 1.0, color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.radius30/2),
                borderSide: BorderSide(width: 1.0, color: Colors.white)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimentions.radius30/2),
            )),
      ),
    );
  }
}
