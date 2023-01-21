import 'dart:ui';

import 'package:food_full_app/Data/repository/popular_product_repo.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/models/cart_model.dart';
import 'package:food_full_app/models/product_models.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];

  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isloaded = false;

  bool get isloaded => _isloaded;
  int _quantity = 0;

  int get quantity => _quantity;
  int _inCartitems = 0;

  int get inCartitems => _inCartitems + _quantity;

  Future<void> getpopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      //print('got productssssssssssss');
      _popularProductList = [];
      _popularProductList.addAll(Product
          .fromJson(response.body)
          .products);
      //print(_popularProductList);// unless we make model we cannot show the data in UI
      _isloaded = true;
      update();
    } else {


    }
  }

  void setQuantity(bool isincriment) {
    if ((isincriment)) {
      _quantity = checkQuantity(_quantity + 1);
      print('number of Items' + quantity.toString());
    }
    else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartitems + quantity) < 0) {
      Get.snackbar('Limit Reached', 'Cant have negative item',
        backgroundColor: Appcolors.bottombaraddtocart,
        colorText: Color(0xffEEEBDD),
      );
      if (inCartitems > 0) {
        _quantity = -quantity;
        return _quantity;
      }
      return 0;
    }
    else if ((_inCartitems + quantity) > 20) {
      Get.snackbar('Limit Reached', 'Cant have more than 20 items',
        backgroundColor: Appcolors.bottombaraddtocart,
        colorText: Color(0xffEEEBDD),);
      return 20;
    }
    else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartitems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // if exist
    // get from storage  _inCartitems..
  //  print('print exist or not' + exist.toString());

    if (exist) {
      _inCartitems = _cart.getQuantity(product);
    }

   // print('the quantity in the cart is ' + _inCartitems.toString());
  }

  void addItem(ProductModel product) {
    // if(_quantity > 0){
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartitems = _cart.getQuantity(product);


    _cart.items.forEach((key, value) {
      print('The id is ' + value.id.toString() + 'The quantity is' +
          value.quantity.toString());
    });
    update();


    // }
    // else{
    //
    //   Get.snackbar('Empty Cart', 'Cant process zero items',
    //   backgroundColor: Appcolors.bottombaraddtocart,
    //       colorText: Color(0xffEEEBDD));


  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;


    // }


  }

}