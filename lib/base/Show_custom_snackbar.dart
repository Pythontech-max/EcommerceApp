import 'package:flutter/material.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void ShowCustomSnackbar(String message , {bool isError= true , String title= "Error"  }){
Get.snackbar(title , message ,titleText: Bigtext(text: title , color: Colors.white ),
messageText: Text( message , style: const TextStyle(color: Colors.white) , ),
colorText: Colors.white,
  snackPosition: SnackPosition.TOP,
  backgroundColor: Appcolors.bottombaraddtocart
);


}