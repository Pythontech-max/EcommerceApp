import 'package:food_full_app/Data/repository/recommended_product_rapo.dart';

import 'package:food_full_app/models/product_models.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController( {required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isloaded = false;
  bool get isloaded => _isloaded;



  Future<void> getRecommendedProductList()async {
    Response  response = await recommendedProductRepo.getRecommendedProductList();
    print(response.statusCode);
    if (response.statusCode == 200  ){
      print('got response ');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
     // print(_recommendedProductList);// unless we make model we cannot show the data in UI
      _isloaded = true;
      update();
    } else {
      print('not got response');


    }


  }

}