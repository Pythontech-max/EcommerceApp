import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/cart_controller.dart';
import 'package:food_full_app/Controllers/popular_product_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/app_constants.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/pages/Cart_page.dart';

import 'package:food_full_app/routes/routes_helper.dart';
import 'package:food_full_app/widgets/Bigtext.dart';

import 'package:food_full_app/widgets/app_column.dart';
import 'package:food_full_app/widgets/app_icons.dart';
import 'package:food_full_app/widgets/expandable_text_widget.dart';

import 'package:get/get.dart';

class Popular extends StatelessWidget {
  final int pageId;
  final String page;
  const Popular({Key? key, required this.pageId , required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: const Color(0xffEEEBDD),
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimentions.popularfoodimage,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD_URL +
                            product.img!))),
              )), //contains images
          Positioned(
              top: Dimentions.height45,
              left: Dimentions.width20,
              right: Dimentions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                      if (page =="cartpage"){
                        Get.toNamed(
                          RouteHelper.getCartPage());}
                      else
                        {Get.toNamed(
                            RouteHelper.getInitial(),
                          );
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                        onTap: () {

                          if(controller.totalItems >= 1)

                          Get.toNamed(RouteHelper.getCartPage());
                        },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconcolour: Colors.transparent,
                                    backgroundcolour:
                                        Appcolors.bottombaraddtocart,
                                    iconsize: 24,
                                  ))
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 3,
                                  top: 3,
                                  child: Bigtext(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    color: Colors.white,
                                    size: 12,
                                  ))
                              : Container(),
                        ],
                      ),
                    );
                  })
                ],
              )), // contain top icons
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimentions.popularfoodimage - Dimentions.height20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimentions.width20,
                      top: Dimentions.width20,
                      right: Dimentions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimentions.radius20),
                          topRight: Radius.circular(Dimentions.radius20)),
                      color: const Color(0xffEEEBDD)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: product.name!,
                      ),
                      SizedBox(
                        height: Dimentions.height10,
                      ),
                      Bigtext(text: 'Introduction'),
                      SizedBox(
                        height: Dimentions.height10,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text: product.description!)))
                    ],
                  ))),
          // Expandable widget for food details
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularproduct) {
        return Container(
          height: Dimentions.height10 * 11,
          padding: EdgeInsets.only(
              top: Dimentions.height10 / 2,
              bottom: Dimentions.height10 / 2,
              left: Dimentions.width20,
              right: Dimentions.width20),
          decoration: BoxDecoration(
            color: Appcolors.bottomnevigationcolour,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimentions.radius20 * 2),
              topRight: Radius.circular(Dimentions.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimentions.height20,
                    right: Dimentions.height20,
                    left: Dimentions.height20,
                    bottom: Dimentions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimentions.radius20),
                    color: const Color(0xffEEEBDD)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularproduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: Appcolors.textcolor,
                      ),
                    ),
                    SizedBox(
                      width: Dimentions.width10,
                    ),
                    Bigtext(text: popularproduct.inCartitems.toString()),
                    SizedBox(
                      width: Dimentions.width10,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularproduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: Appcolors.textcolor,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  popularproduct.addItem(product);
                },
                child: Container(
                  child: Bigtext(
                    text: '\$ ${product.price!} | Add to cart ',
                    color: const Color(0xffEEEBDD),
                  ),
                  decoration: BoxDecoration(
                      color: Appcolors.bottombaraddtocart,
                      borderRadius: BorderRadius.circular(Dimentions.radius20)),
                  padding: EdgeInsets.only(
                      top: Dimentions.height20,
                      right: Dimentions.height20,
                      left: Dimentions.height20,
                      bottom: Dimentions.height20),
                ),
              )
            ],
          ),
        );
      }), // contain bottom bar with buttons
    );
  }
}
