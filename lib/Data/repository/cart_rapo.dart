// rapos are dedicated to store data

import 'dart:convert';

import 'package:food_full_app/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRapo{
  final SharedPreferences sharedPreferences;
  CartRapo({required this.sharedPreferences});
  // note shared Preference accepts string ;

  List<String> cart = [];
  List<String> cartHistory = [];
  void addtoCartList(List<CartModel>cartList ){
    
    //sharedPreferences.remove(AppConstants.CART_List);
    // sharedPreferences.remove(AppConstants.CART_History_LIST);
    var time = DateTime.now().toString();
    cart = [];
    // converting object to string because shared preferences need String
    // converting object to json with the help of jsonEncode
    cartList.forEach((element) {
      element.time = time;
     return cart.add(jsonEncode(element));
      
    });


  sharedPreferences.setStringList(AppConstants.CART_List, cart);
 print(sharedPreferences.getStringList(AppConstants.CART_List));

  //getCartList();

  }


List<CartModel> getCartList(){

    List<String>? carts = [];

    if (sharedPreferences.containsKey(AppConstants.CART_List)){
     carts = sharedPreferences.getStringList(AppConstants.CART_List);
      print("Inside get chart list"+carts.toString());
    }
    List<CartModel> cartList = [];
    // converting cart model into object of list ;
    // jsonDecode converting json to object
    carts?.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }
     );
    return cartList;
  }

  List<CartModel>getCartHistoryList(){

    if(sharedPreferences.containsKey(AppConstants.CART_History_LIST)){
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_History_LIST)!;
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element)=> cartHistoryList.add(CartModel.fromJson(jsonDecode(element))) );
    return cartHistoryList;
  }

void addtoCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_History_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_History_LIST)!;
    }
     for(int i = 0 ; i < cart.length ; i++){
       cartHistory.add(cart[i]);
     }
     removeCart();
    sharedPreferences.setStringList(AppConstants.CART_History_LIST, cartHistory);
    print("The length of chart history list "+getCartHistoryList().length.toString());
    for(int j = 0 ; j < getCartHistoryList().length ; j++ ){
    print("The time for order is  "+getCartHistoryList()[0].time.toString());}
}

void removeCart(){
  cart = [];
  sharedPreferences.remove(AppConstants.CART_List);
}

void clearCartHistory(){
  removeCart();
  cartHistory = [];
  sharedPreferences.remove(AppConstants.CART_History_LIST);

}



}

