import 'package:get/get.dart';



class Dimentions{
  static double screenheight = Get.context!.height;
  static double screenwidth = Get.context!.width;

  // 684/220 = 3.11
  static double pageviewcontainer = screenheight/3.11;
  // 684/120
  static double pageviewtextcontainer = screenheight/5.7;
  // 684/320
  static double pageview = screenheight/2.13;

  // icon size
static double iconSize24 = screenheight/28.5;
static double iconSize16 = screenheight/42.75;

// radius
  static double radius15 = screenheight/45.6;
  static double radius30 = screenheight/22.8;
  static double radius20 = screenheight/34.2;

  // fonts
  static double fonts20 = screenheight/34.2;
  static double fonts26 = screenheight/26.3;

  // Dynamic Width padding & margin
  static double width10 = screenheight/68.4;
  static double width15 = screenheight/45.6;
  static double width20 = screenheight/34.2;
  static double width30 = screenheight/22.8;

  // Dynamic Height padding & margin .
  static double height10 = screenheight/68.4;
  static double height15 = screenheight/45.6;
  static double height20 = screenheight/34.2;
  static double height30 = screenheight/22.8;
  static double height45 = screenheight/15.2;

  // Listview text container height // screen width : 411.42857142857144

static double listviewimagescreen130 = screenwidth/3.16;
static double listviewtextcontsize120 = screenwidth/3.43;

// popular food details

static double popularfoodimage = screenheight/1.95;

// splash screen dimentions

static double splashImagelogo1 = screenheight/2.28;
static double splashImagelogo2 = screenheight/3.42;
















}