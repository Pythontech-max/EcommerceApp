import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/cart_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/app_constants.dart';
import 'package:food_full_app/base/no_data_page.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/models/cart_model.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:food_full_app/widgets/app_icons.dart';
import 'package:food_full_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    // List<int> cartItemsPerOrdertoList() {
    //   return cartItemsPerOrder.entries.map((e) => e.value).toList();
    //
    // }
    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> carOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;
    Widget timeWidget(int index ){
      var outputDate = DateTime.now().toString();

      if(index < getCartHistoryList.length){
        DateTime parseDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(
            getCartHistoryList[listCounter].time!);
        var inputDate =
        DateTime.parse(parseDate.toString());
        var outputFormat =
        DateFormat("MM-dd-yyyy hh:mm a");
         outputDate = outputFormat.format(inputDate);

      }
      return Bigtext(text: outputDate);


    }





    return Scaffold(
      backgroundColor: Color(0xffEEEBDD),
      body: Column(children: [
        Container(
          height: Dimentions.height10 * 10,
          color: Appcolors.maincolor,
          width: double.infinity,
          padding: EdgeInsets.only(top: Dimentions.height45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bigtext(
                text: "Cart History",
                color: Color(0xffFCD900),
              ),
              AppIcon(
                icon: Icons.add_shopping_cart_outlined,
                iconcolour: Appcolors.maincolor,
              )
            ],
          ),
        ),
        GetBuilder<CartController>(builder: (_cartController){
          return _cartController.getCartHistoryList().length>0 ? Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimentions.height20,
                left: Dimentions.width20,
                right: Dimentions.width20,
              ),
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      for (int i = 0; i < itemsPerOrder.length; i++)
                        Container(
                          height: Dimentions.height10 * 12,
                          margin: EdgeInsets.only(bottom: Dimentions.height20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                timeWidget(listCounter),
                                SizedBox(height: Dimentions.height10 / 2),
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(
                                              itemsPerOrder[i], (index) {
                                            if (listCounter <
                                                getCartHistoryList.length) {
                                              listCounter++;
                                            }
                                            return index <= 2
                                                ? Container(
                                              height:
                                              Dimentions.height10 * 8,
                                              width: Dimentions.width10 * 8,
                                              margin: EdgeInsets.only(
                                                  right:
                                                  Dimentions.width10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(Dimentions
                                                      .radius15 /
                                                      2),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        AppConstants
                                                            .BASE_URL +
                                                            AppConstants
                                                                .UPLOAD_URL +
                                                            getCartHistoryList[
                                                            listCounter -
                                                                1]
                                                                .img!,
                                                      ))),
                                            )
                                                : Container();
                                          })),
                                      Container(
                                        height: Dimentions.height10 * 8,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Smalltext(
                                                text: "Total",
                                                color: Appcolors.textcolor),
                                            Bigtext(
                                              text: (itemsPerOrder[i] <= 1
                                                  ? itemsPerOrder[i].toString() +
                                                  " Item"
                                                  : itemsPerOrder[i].toString() +
                                                  " Items"),
                                              color: Appcolors.textcolor,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // print("during test"+itemsPerOrder[i].toString());
                                                var orderTimes = carOrderTimeToList();
                                                // print("order time "+orderTimes[i].toString());
                                                Map<int, CartModel> moreOrder = {};
                                                for (int j=0; j<getCartHistoryList.length; j++) {
                                                  if (getCartHistoryList[j].time==orderTimes[i]) {
                                                    // print("myproduct id  is " +getCartHistoryList[j].id.toString());
                                                    moreOrder.putIfAbsent(getCartHistoryList[j].id!, () =>
                                                        CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j]))));
                                                    // print("the prosudr info is "+jsonEncode(getCartHistoryList[j]));

                                                  }
                                                }
                                                Get.find<CartController>().setItems = moreOrder;
                                                Get.find<CartController>().addToCartList();
                                                Get.toNamed(RouteHelper.getCartPage());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                    Dimentions.width10,
                                                    vertical:
                                                    Dimentions.height10 / 2),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        Dimentions.radius15 /
                                                            3),
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                        Appcolors.maincolor)),
                                                child:
                                                Smalltext(text: "one more "),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ]),
                        ),
                    ],
                  )),
            ),
          ) : Expanded(
            child: SizedBox( height: MediaQuery.of(context).size.height*0.07 ,

                  child: Center(
                    child: NoDataPage(text: "No History To Show" ,
                      ImagePath: "lib/assets/image/box.png",),
                  ),
                ),
          );
        }

        )
      ]),
    );
  }
}
