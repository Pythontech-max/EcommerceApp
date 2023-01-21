import 'dart:ui';

import 'package:food_full_app/Data/repository/cart_rapo.dart';
import 'package:food_full_app/models/cart_model.dart';
import 'package:food_full_app/models/product_models.dart';
import 'package:get/get.dart';

import '../colors.dart';

class CartController extends GetxController {
  final CartRapo cartrapo;
  CartController({required this.cartrapo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;
  // only for storage and sharedpreferences.
  // contains list of cart model object.
  List<CartModel> storageItems = [];
  void addItem(ProductModel product, int quantity) {
    // print('length of item is '+_items.length.toString());

    var totalQuantity = 0;

    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          isExist: true,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          // print('adding item to the cart id '+product.id!.toString()+'quantity :'+quantity.toString());
          //_items.forEach((key, value) {// later prints to the cart
          //  print('quantity is '+value.quantity.toString());
          // });
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            isExist: true,
            quantity: quantity,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar('Empty Cart', 'Cant process zero items',
            backgroundColor: Appcolors.bottombaraddtocart,
            colorText: Color(0xffEEEBDD));
      }
    }
    cartrapo.addtoCartList(getItems);
    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if ((key == product.id)) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) => e.value).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartrapo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    print('length of cart items ' + storageItems.length.toString());

    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory() {
    cartrapo.addtoCartHistoryList();
    clear();
  }

// it will be cleared from cartlist when button is tapped ,
// but it is present in CART_HISTORY_LIST
  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartrapo.getCartHistoryList();
  }

      set setItems(Map<int , CartModel> setItems){
        _items = {};
        _items = setItems;

      }

      void addToCartList(){
      cartrapo.addtoCartList(getItems);
        update();
  }
     void clearCartHistory(){
     cartrapo.clearCartHistory();
     update();

     }

}
