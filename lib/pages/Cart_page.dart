import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/auth_controller.dart';
import 'package:food_full_app/Controllers/cart_controller.dart';
import 'package:food_full_app/Controllers/popular_product_controller.dart';
import 'package:food_full_app/Controllers/recommended_product_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/app_constants.dart';
import 'package:food_full_app/auth/sign_in_page.dart';
import 'package:food_full_app/base/no_data_page.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/home/main_food_page.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:food_full_app/widgets/app_icons.dart';
import 'package:food_full_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEEEBDD),
        body: Stack(
          children: [
            Positioned(
                top: Dimentions.height20 * 3,
                left: Dimentions.width20,
                right: Dimentions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconcolour: const Color(0xffEEEBDD),
                      backgroundcolour: Appcolors.bottombaraddtocart,
                      iconsize: Dimentions.iconSize24,
                    ),
                    SizedBox(
                      width: Dimentions.width20 * 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                        ;
                      },
                      child: AppIcon(
                        icon: Icons.home,
                        iconcolour: const Color(0xffEEEBDD),
                        backgroundcolour: Appcolors.bottombaraddtocart,
                        iconsize: Dimentions.iconSize24,
                      ),
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      iconcolour: const Color(0xffEEEBDD),
                      backgroundcolour: Appcolors.bottombaraddtocart,
                      iconsize: Dimentions.iconSize24,
                    )
                  ],
                )),
            GetBuilder<CartController>(builder: (_cartController) {
              return _cartController.getItems.length > 0
                  ? Positioned(
                      top: Dimentions.height20 * 5,
                      left: Dimentions.height20,
                      right: Dimentions.height20,
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimentions.height15),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                              builder: (cartController) {
                            var _cartList = cartController.getItems;
                            return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: (_, int index) {
                                return Container(
                                  height: Dimentions.height20 * 5,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getpopularFood(
                                                    popularIndex, "cartpage"));
                                          } else {
                                            var recommendedIndex = Get.find<
                                                    RecommendedProductController>()
                                                .recommendedProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                            //  Get.toNamed(RouteHelper.getrecommendedFood(recommendedIndex , "cartpage"));
                                            if (recommendedIndex < 0) {
                                              Get.snackbar('History Products ',
                                                  'Product riview not available for history products ',
                                                  backgroundColor: Appcolors
                                                      .bottombaraddtocart,
                                                  colorText: Color(0xffEEEBDD));
                                            } else {
                                              Get.toNamed(RouteHelper
                                                  .getrecommendedFood(
                                                      recommendedIndex,
                                                      "cartpage"));
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: Dimentions.height20 * 5,
                                          height: Dimentions.height20 * 5,
                                          margin: EdgeInsets.only(
                                              bottom: Dimentions.height10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimentions.radius20),
                                            color: Colors.white,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  left: Dimentions.width10),
                                              height: Dimentions.height20 * 5,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Bigtext(
                                                      text: cartController
                                                          .getItems[index]
                                                          .name!,
                                                      color: Colors.black54,
                                                    ),
                                                    Smalltext(text: 'Spicy'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Bigtext(
                                                          text: cartController
                                                              .getItems[index]
                                                              .price
                                                              .toString(),
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(
                                                              top: Dimentions
                                                                  .height10,
                                                              right: Dimentions
                                                                  .height10,
                                                              left: Dimentions
                                                                  .height10,
                                                              bottom: Dimentions
                                                                  .height10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      Dimentions
                                                                          .radius20),
                                                              color: const Color(
                                                                  0xffEEEBDD)),
                                                          child: Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  cartController.addItem(
                                                                      _cartList[
                                                                              index]
                                                                          .product!,
                                                                      -1);
                                                                },
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: Appcolors
                                                                      .textcolor,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: Dimentions
                                                                    .width10,
                                                              ),
                                                              Bigtext(
                                                                  text: _cartList[
                                                                          index]
                                                                      .quantity
                                                                      .toString()), //popularproduct.inCartitems.toString()),
                                                              SizedBox(
                                                                width: Dimentions
                                                                    .width10,
                                                              ),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    cartController.addItem(
                                                                        _cartList[index]
                                                                            .product!,
                                                                        1);
                                                                  },
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Appcolors
                                                                        .textcolor,
                                                                  ))
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ])))
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                      ))
                  : NoDataPage(text: "Your Cart is Empty !!!");
            })
          ],
        ),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
          return Container(
            height: Dimentions.height10 * 11,
            padding: EdgeInsets.only(
                top: Dimentions.height10 / 2,
                bottom: Dimentions.height10 / 2,
                left: Dimentions.width20,
                right: Dimentions.width20),
            decoration: BoxDecoration(
              color: cartController.items.length > 0
                  ? Appcolors.bottomnevigationcolour
                  : Color(0xffEEEBDD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimentions.radius20 * 2),
                topRight: Radius.circular(Dimentions.radius20 * 2),
              ),
            ),
            child: cartController.getItems.length > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: Dimentions.height20,
                            right: Dimentions.height20,
                            left: Dimentions.height20,
                            bottom: Dimentions.height20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimentions.radius20),
                            color: const Color(0xffEEEBDD)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimentions.width10,
                            ),
                            Bigtext(
                                text: "\$ " +
                                    cartController.totalAmount.toString()),
                            SizedBox(
                              width: Dimentions.width10,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                         if( Get.find<AuthController>().userLoggedIn()){
                           cartController.addToHistory();
                         }
                         else{
                          Get.toNamed(RouteHelper.getSignInPage());
                         }
                          //popularproduct.addItem(product);


                        },
                        child: Container(
                          child: Bigtext(
                            text: 'Check-Out',
                            color: const Color(0xffEEEBDD),
                          ),
                          decoration: BoxDecoration(
                              color: Appcolors.bottombaraddtocart,
                              borderRadius:
                                  BorderRadius.circular(Dimentions.radius20)),
                          padding: EdgeInsets.only(
                              top: Dimentions.height20,
                              right: Dimentions.height20,
                              left: Dimentions.height20,
                              bottom: Dimentions.height20),
                        ),
                      )
                    ],
                  )
                : Container(),
          );
        }));
  }
}
