import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/cart_controller.dart';
import 'package:food_full_app/Controllers/popular_product_controller.dart';
import 'package:food_full_app/Food_Details/recommended_food_detail.dart';
import 'package:food_full_app/auth/sign_in_page.dart';
import 'package:food_full_app/auth/sign_up_page.dart';
import 'package:food_full_app/home/food_page_body.dart';
import 'package:food_full_app/home/main_food_page.dart';
import 'package:food_full_app/pages/Cart_page.dart';
import 'package:food_full_app/pages/Splash_page.dart';
import 'package:food_full_app/pages/cart_history.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'Controllers/recommended_product_controller.dart';
import 'Dimentions.dart';
import 'Food_Details/popular_food_details.dart';
import 'helper/Depencencies.dart'as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    // getting excess to the controller by .notation its field or method.

    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
           initialRoute: RouteHelper.getSplashScreen(),
           getPages: RouteHelper.routes,

         // home: SignInPage(),

        );
      });
    });
  }
}

