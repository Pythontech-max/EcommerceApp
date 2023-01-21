import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/auth_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("I am printing loading state"+Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimentions.height10*10,
        width: Dimentions.width10*10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimentions.height10*5),
          color: Appcolors.maincolor
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Colors.grey,),
      ),
    );
  }
}
