import 'package:flutter/material.dart';
import 'package:food_full_app/account/account.dart';
import 'package:food_full_app/auth/sign_up_page.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/home/main_food_page.dart';

import '../auth/sign_in_page.dart';
import 'cart_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  List pages = [
    mainfoodpage(),
    SignInPage(),
    CartHistory(),
    Container(child: AccountPage(),),
  ];
  void onTapNav(int index){
    setState(() {
      _selectedindex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Appcolors.bottombaraddtocart,
        unselectedItemColor: Appcolors.maincolor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedindex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined ),
            label: "home" ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive ),
            label: "home" ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart ),
            label: "home" ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person ),
            label: "home" ,
          ),



        ],


      ),


    );
  }
}
