import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Controllers/auth_controller.dart';
import 'package:food_full_app/Controllers/cart_controller.dart';
import 'package:food_full_app/Controllers/user_controller.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/base/custom_loader.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/routes/routes_helper.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:food_full_app/widgets/app_icons.dart';
import 'package:get/get.dart';

import 'Account_Widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
       backgroundColor: Color(0xffEEEBDD),
        appBar: AppBar(title: Center(child: Bigtext( text: "Profile", size: 24,color:  const Color(0xffFCD900),),  ) ,backgroundColor: Appcolors.maincolor,
        ),
      body: GetBuilder<UserController>(builder: (usercontroller){
        return _userLoggedIn?
        (usercontroller.isLoading?Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimentions.height20),

          child: Column(

            children: [
              AppIcon(icon: Icons.person , backgroundcolour: Color(0xff8267BE), iconcolour: Colors.white,iconsize: Dimentions.height15*5 ,size: Dimentions.height15*10,),
              SizedBox(height: Dimentions.height20,),
              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(appIcon:             AppIcon(icon: Icons.person , backgroundcolour: Color(0xff8267BE), iconcolour: Colors.white,iconsize: Dimentions.height10*5/2 ,size: Dimentions.height10*5,),
                        bigtext:Bigtext(text: usercontroller.userModel.name,) ),
                    SizedBox(height: Dimentions.height10,),
                    AccountWidget(appIcon:             AppIcon(icon: Icons.phone , backgroundcolour: Color(0xff8267BE), iconcolour: Colors.white,iconsize: Dimentions.height10*5/2 ,size: Dimentions.height10*5,),
                        bigtext:Bigtext(text: usercontroller.userModel.phone,) ),
                    SizedBox(height: Dimentions.height10,),
                    AccountWidget(appIcon:             AppIcon(icon: Icons.email_outlined , backgroundcolour: Colors.red, iconcolour: Colors.white,iconsize: Dimentions.height10*5/2 ,size: Dimentions.height10*5,),
                        bigtext:Bigtext(text: usercontroller.userModel.email,) ),
                    SizedBox(height: Dimentions.height10,),
                    AccountWidget(appIcon:             AppIcon(icon: Icons.place_outlined, backgroundcolour: Color(0xff8267BE), iconcolour: Colors.white,iconsize: Dimentions.height10*5/2 ,size: Dimentions.height10*5,),
                        bigtext:Bigtext(text: "Fill in Address",) ),
                    SizedBox(height: Dimentions.height10,),
                    GestureDetector(
                      onTap: (){
                        if(Get.find<AuthController>().userLoggedIn()){
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSignInPage());
                        }
                        else {
                          print("logged out");
                        }
                      },

                      child: AccountWidget(appIcon: AppIcon(icon: Icons.logout, backgroundcolour: Colors.red, iconcolour: Colors.white,iconsize: Dimentions.height10*5/2 ,size: Dimentions.height10*5,),
                          bigtext:Bigtext(text: "Log-out",) ),),


                    SizedBox(height: Dimentions.height10,),












                  ],







                ),





              ))



            ],




          ),

        ):
        CustomLoader()):
        Container(child:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: double.maxFinite,height: Dimentions.height20*18,margin: EdgeInsets.only(left: Dimentions.width20 , right: Dimentions.width20),decoration: BoxDecoration(image:DecorationImage(fit: BoxFit.cover,image: AssetImage("lib/assets/image/login.png")) ),),
            SizedBox(height: Dimentions.height20,),
           GestureDetector(onTap:(){Get.toNamed(RouteHelper.getSignInPage());} ,child:             Container(width: Dimentions.width20*10,height: Dimentions.height20*3,margin: EdgeInsets.only(left: Dimentions.width20 , right: Dimentions.width20),child: Center(child: Bigtext(text: 'Sign-in',color: Colors.white,size: Dimentions.fonts20*1.5,)),decoration: BoxDecoration(color: Appcolors.maincolor , borderRadius: BorderRadius.circular(Dimentions.radius15)),),
               )
          ],
        ))) ;
      }),
    );
  }
}


