import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:food_full_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/popular_product_controller.dart';
import '../Controllers/recommended_product_controller.dart';
import 'food_page_body.dart';

// it will hold the header and body section
class mainfoodpage extends StatefulWidget {
  const mainfoodpage({Key? key}) : super(key: key);

  @override
  _mainfoodpageState createState() => _mainfoodpageState();
}

class _mainfoodpageState extends State<mainfoodpage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getpopularProductList();
    await  Get.find<RecommendedProductController>().getRecommendedProductList();

  }
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Color(0xffEEEBDD),
      body: RefreshIndicator(child:  Column(
        children: [
          Container(
            child: Container(
              
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Bigtext(
                        text: 'India',
                        color: Appcolors.maincolor,
                      ),
                      Row(children: [
                        Smalltext(text: 'Varanasi', color: Appcolors.textcolor),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ]),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimentions.height45,
                      height: Dimentions.height45,
                      child:  Icon(
                        Icons.search,
                        color: const Color(0xffFCD900),size: Dimentions.iconSize24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimentions.radius15),
                        color: Appcolors.maincolor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ), // showing the header

          const Expanded(child: SingleChildScrollView(child: foodbody() ,) ),
          // showing the body
        ],
      ), onRefresh: _loadResource ,backgroundColor: Color(0xffEEEBDD) ),
    );

    // refresh indicator develops loading function


  }
}
