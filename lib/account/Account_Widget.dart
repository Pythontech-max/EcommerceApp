import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/widgets/Bigtext.dart';
import 'package:food_full_app/widgets/app_icons.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  Bigtext bigtext;
   AccountWidget({Key? key, required this.appIcon , required this.bigtext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: Dimentions.height20 , right: Dimentions.height10 ,top: Dimentions.height10,bottom: Dimentions.height10),
     child: Row(
       children: [
         appIcon,
         SizedBox(width: Dimentions.width20,),
         bigtext
       ],
     ),
      decoration: BoxDecoration(
          color: Colors.white,

        boxShadow: [ BoxShadow( offset: Offset(0,1), color: Colors.grey.withOpacity(0.2)  ,blurRadius: 1           ),
        ]
      ),

    );
  }
}
