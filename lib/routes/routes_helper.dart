import 'package:food_full_app/Food_Details/popular_food_details.dart';
import 'package:food_full_app/Food_Details/recommended_food_detail.dart';
import 'package:food_full_app/auth/sign_in_page.dart';
import 'package:food_full_app/home/main_food_page.dart';
import 'package:food_full_app/pages/Cart_page.dart';
import 'package:food_full_app/pages/Home_Page.dart';
import 'package:food_full_app/pages/Splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularFood = "/popular-food";
  static const String recommendedfood = "/recommended-food";
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-In';


  static String getSplashScreen() => '$splashPage'  ;
  static String getInitial() => "$initial";
  static String getpopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page"; // passing multiple parameters
  static String getrecommendedFood(int pageId, String page) =>
      "$recommendedfood?pageId=$pageId&page=$page";
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: ()=> SplashScreen() ),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          var page = Get.parameters["page"];

          return Popular(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.zoom),
    GetPage(
        name: recommendedfood,
        page: () {
          var pageId = Get.parameters["pageId"];
          var page = Get.parameters["page"];
          return Recommendedfooddetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.zoom),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signIn,
        page: () {
          return SignInPage();
        },
        transition: Transition.downToUp)
  ];
}

class Splashpage {
}
