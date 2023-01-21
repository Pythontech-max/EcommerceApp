import 'package:food_full_app/models/product_models.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  bool? isExist;
  String? time;
  int? quantity;
  ProductModel? product;      // we can access product object using dot operator


  CartModel(
      {this.id,
        this.name,
        this.price,
        this.img,
        this.isExist,
        this.time,
        this.quantity,
        this.product,


      });
  // converting json to object
  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
    product = ProductModel.fromJson(json['product']);

  }
   // converting object to json
 Map<String , dynamic> toJson(){

    return {

      "id" : this.id,
      "name" : this.name,
      "price" : this.price,
      "img" : this.img,
      "quantity" : this.quantity,
      "time" : this.time,
      "isExist" : this.isExist,
      "product" : this.product?.toJson()


    };




 }




}