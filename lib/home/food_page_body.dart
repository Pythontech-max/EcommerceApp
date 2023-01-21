import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/popular_product_controller.dart';
import 'package:food_full_app/Controllers/recommended_product_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/Food_Details/popular_food_details.dart';
import 'package:food_full_app/app_constants.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/models/product_models.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:food_full_app/widgets/Icon_and_text_widget.dart';
import 'package:food_full_app/widgets/small_text.dart';
import 'package:get/get.dart';

class foodbody extends StatefulWidget {
  const foodbody({Key? key}) : super(key: key);

  @override
  _foodbodyState createState() => _foodbodyState();
}

class _foodbodyState extends State<foodbody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  //इसकी वजह से स्लाइडर का खाना दोनों साइड का दिकता है

  var _currPageValue = 0.0;
  final double _scalefactor = 0.8;
  final double _height = Dimentions.pageviewcontainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print('The current page value'+_currPageValue.toString());
        // पेज वैल्यू पता चल जाता है
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isloaded?Container(
            height: Dimentions.pageview,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildpageitem(
                      position,popularProducts.popularProductList[position] ); // ऊपर वाले का काम नीचे वाला करेगा
                }),
          ):CircularProgressIndicator(
            color: Appcolors.maincolor
          );
        }),// wraping against get package
        // dots
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
              position: _currPageValue,
              decorator: const DotsDecorator(
                color: Color(0xff06113C), // Inactive color
                activeColor: Colors.redAccent,
              ),
            );
          }
        )
        //popular
        ,
        SizedBox(
          height: Dimentions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimentions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bigtext(text: 'Recommended Food Items'),
              SizedBox(
                width: Dimentions.height10,
              ),
              Container(
                child: Bigtext(
                  text: '.',
                ),
                margin: const EdgeInsets.only(bottom: 3),
              ),
              SizedBox(
                width: Dimentions.height10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Smalltext(
                  text: 'Other choices',
                ),
              )
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
        return recommendedProduct.isloaded?ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: recommendedProduct.recommendedProductList.length,
    itemBuilder: (context, index) {
    return GestureDetector(
      onTap: ()=> Get.toNamed(RouteHelper.getrecommendedFood(index , "home"),),
      child: Container(
      margin: EdgeInsets.only(
      left: Dimentions.width20,
      right: Dimentions.width20,
      bottom: Dimentions.height10),
      child: Row(
      children: [
      Container(
      width: Dimentions.listviewimagescreen130,
      height: Dimentions.listviewimagescreen130,
      decoration: BoxDecoration(
      borderRadius:
      BorderRadius.circular(Dimentions.radius30),
      color: const Color(0xffEEEBDD),
      image:  DecorationImage(
        fit: BoxFit.cover,
      image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+ recommendedProduct.recommendedProductList[index].img!
      )
      )
      ),
      ),
      Expanded(
      child: Container(
      height: Dimentions.listviewtextcontsize120,
      decoration: BoxDecoration(
      boxShadow: const [
      BoxShadow(color: Color(0xffFEB377), offset: Offset(0, 5)),
      BoxShadow(
      color: Color(0xffEEEBDD), offset: Offset(-5, 0)),
      BoxShadow(color: Color(0xffEEEBDD), offset: Offset(5, 0))
      ],
      borderRadius: BorderRadius.only(
      topRight:
      Radius.circular(Dimentions.radius20),
      bottomRight:
      Radius.circular(Dimentions.radius20)),
      color: Color(0x4DFDCB9E)),
      child: Padding(
      padding: EdgeInsets.only(
      right: Dimentions.width10/2,
      top: Dimentions.height10
      ,left: Dimentions.width10),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Bigtext(text: recommendedProduct.recommendedProductList[index].name!)
        ,SizedBox(height: Dimentions.height10,),
      Smalltext(
      text: 'From popular Delhi restaurant '),SizedBox(height: Dimentions.height10,),
      Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceAround,

      children:  [
      Flexible(
      child: IconAndtextwidget(
      icon: IconData(0xf81c,
      fontFamily: 'MaterialIcons'),
      IconColor: Color(0xffF9D923),
      text: 'Delicious',
      color: Color(0xff9A86A4),
      ),
      ),
      IconAndtextwidget(
      icon: IconData(0xe3ac,
      fontFamily: 'MaterialIcons'),
      IconColor: Color(0xffF32424),
      text: '1.7 km',
      color: Color(0xff9A86A4),
      ),
      IconAndtextwidget(
      icon: IconData(0xe662,
      fontFamily: 'MaterialIcons'),
      IconColor: Color(0xffF806CC),
      text: '32 min',
      color: Color(0xff9A86A4),
      )
      ],
      )
      ],
      ))),
      )
      ],
      ),
      ),
    );
    }):CircularProgressIndicator(color: Appcolors.maincolor,);
        },

        )],
    );
  }

  Widget _buildpageitem(int index, ProductModel popularProduct) { // catching as popular product
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scalefactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scalefactor + (_currPageValue - index + 1) * (1 - _scalefactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scalefactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scalefactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(onTap: (){
            Get.toNamed(RouteHelper.getpopularFood(index ,"home"));
          },
            child: Container(
              height: Dimentions.pageviewcontainer,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven
                      ? const Color(0xffE8C07D)
                      : const Color(0xff9FC088),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage( AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!

                      )
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimentions.pageviewtextcontainer,
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffF0F0F0),
                    boxShadow: const [
                      BoxShadow(color: Color(0xffC1CFC0), offset: Offset(0, 5)),
                      BoxShadow(
                          color: Color(0xffF0F0F0), offset: Offset(-5, 0)),
                      BoxShadow(color: Color(0xffF0F0F0), offset: Offset(5, 0))
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 15, right: 30, bottom: 15, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bigtext(text: popularProduct.name!),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: Appcolors.maincolor,
                                      size: 15,
                                    )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Smalltext(text: '4.5'),
                          const SizedBox(
                            width: 10,
                          ),
                          Smalltext(text: '1455'),
                          const SizedBox(
                            width: 10,
                          ),
                          Smalltext(text: 'comments'),
                        ],
                        // व्रैप विजेट मल्टीप्ल अप्प पैदा करेगा।
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            IconAndtextwidget(
                              icon:
                                  IconData(0xf81c, fontFamily: 'MaterialIcons'),
                              IconColor: Color(0xffF9D923),
                              text: 'Delicious',
                              color: Color(0xff9A86A4),
                            ),
                            IconAndtextwidget(
                              icon:
                                  IconData(0xe3ac, fontFamily: 'MaterialIcons'),
                              IconColor: Color(0xffF32424),
                              text: '1.7 km',
                              color: Color(0xff9A86A4),
                            ),
                            IconAndtextwidget(
                              icon:
                                  IconData(0xe662, fontFamily: 'MaterialIcons'),
                              IconColor: Color(0xffF806CC),
                              text: '32 min',
                              color: Color(0xff9A86A4),
                            )
                          ],
                        ), // This is 3 icons strip
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
