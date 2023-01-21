import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/cart_controller.dart';
import 'package:food_full_app/Controllers/popular_product_controller.dart';
import 'package:food_full_app/Controllers/recommended_product_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/pages/Cart_page.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:food_full_app/widgets/app_icons.dart';
import 'package:food_full_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../app_constants.dart';

class Recommendedfooddetail extends StatelessWidget {
  final int pageId;
  final String page;
  const Recommendedfooddetail(
      {Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Color(0xffEEEBDD),
      body: CustomScrollView(
        //  physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      if (page == "cartpage"){
                        Get.toNamed(
                            RouteHelper.getCartPage());
                      }
                      else
                      {
                        Get.toNamed(
                          RouteHelper.getInitial()
                        );
                      }
                    },
                    child: AppIcon(icon: Icons.clear)),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.totalItems >= 1)
                        Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1
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

                //AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimentions.radius20),
                        topLeft: Radius.circular(Dimentions.radius20)),
                    color: Color(0xffEEEBDD)),
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                    child: Bigtext(
                  text: product.name!,
                  size: Dimentions.fonts26,
                )),
                width: double.maxFinite,
              ),
            ),
            pinned: true,
            backgroundColor: Appcolors.bottombaraddtocart,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(
                    left: Dimentions.width20, right: Dimentions.width20),
                child: Column(
                  children: [
                    Container(
                      child: ExpandableTextWidget(text: product.description!),
                      margin: EdgeInsets.only(
                          left: Dimentions.width20, right: Dimentions.width20),
                    )
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimentions.width20 * 2.5,
                  right: Dimentions.width20 * 2.5,
                  top: Dimentions.width10,
                  bottom: Dimentions.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        iconsize: Dimentions.iconSize24,
                        iconcolour: Colors.white,
                        backgroundcolour: Appcolors.bottombaraddtocart,
                      )),
                  Bigtext(
                    text: ' \$ ${product.price}  X  ${controller.inCartitems}',
                    size: Dimentions.fonts26,
                  ),
                  GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        iconsize: Dimentions.iconSize24,
                        iconcolour: Colors.white,
                        backgroundcolour: Appcolors.bottombaraddtocart,
                      )),
                ],
              ),
            ),
            Container(
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
                          borderRadius:
                              BorderRadius.circular(Dimentions.radius20),
                          color: Color(0xffEEEBDD)),
                      child: Icon(
                        Icons.favorite,
                        color: Appcolors.bottombaraddtocart,
                      )),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      child: Bigtext(
                        text: '\$ ${product.price} | Add to cart ',
                        color: Color(0xffEEEBDD),
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
              ),
            ),
          ],
        );
      }),
    );
  }
}
