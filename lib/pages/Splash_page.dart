import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/popular_product_controller.dart';
import 'package:food_full_app/Controllers/recommended_product_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

/*
.. cascade operator saves time.

var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;


var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;

*/


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation ;
  late AnimationController controller;

 Future<void> _loadResource() async {
   await Get.find<PopularProductController>().getpopularProductList();
   await  Get.find<RecommendedProductController>().getRecommendedProductList();

  }


  @override
  void initState(){
    super.initState();
    _loadResource();
    controller = new AnimationController(vsync: this , duration: Duration(seconds: 3) , )..forward();

    animation =  new CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 4),
            ()=>Get.offNamed(RouteHelper.getInitial())

    );



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation ,child: Center(child: Image.asset('lib/assets/image/Logo1.png', width: Dimentions.splashImagelogo1,))),
          Center(child: Image.asset('lib/assets/image/Logo2.png', width: Dimentions.splashImagelogo2,)),



        ],
      ),
    );
  }
}
