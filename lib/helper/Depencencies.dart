import 'package:food_full_app/Controllers/auth_controller.dart';
import 'package:food_full_app/Controllers/cart_controller.dart';
import 'package:food_full_app/Controllers/popular_product_controller.dart';
import 'package:food_full_app/Controllers/recommended_product_controller.dart';
import 'package:food_full_app/Data/Api/Api_client.dart';
import 'package:food_full_app/Data/repository/Auth_rapo.dart';
import 'package:food_full_app/Data/repository/cart_rapo.dart';
import 'package:food_full_app/Data/repository/popular_product_repo.dart';
import 'package:food_full_app/Data/repository/recommended_product_rapo.dart';
import 'package:food_full_app/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controllers/user_controller.dart';
import '../Data/repository/user_rapo.dart';

Future <void>  init()async{
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // this is our init() method to load dependency
   // for Api Client
  Get.lazyPut(() => ApiClient(appBasedUrl: AppConstants.BASE_URL , sharedPreferences: Get.find() ));
  Get.lazyPut(() => AuthRapo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRapo(apiClient: Get.find()));


  // for repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRapo(sharedPreferences : Get.find()));


  // controller
  Get.lazyPut(() => PopularProductController( popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController( recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartrapo: Get.find()));
  Get.lazyPut(() => AuthController(authRapo: Get.find()));
  Get.lazyPut(() => UserController(userRapo: Get.find()));



}