import 'package:food_full_app/Data/repository/Auth_rapo.dart';
import 'package:food_full_app/models/auth_response_model.dart';
import 'package:food_full_app/models/signup_body.dart';
import 'package:food_full_app/models/user_model.dart';
import 'package:get/get.dart';

import '../Data/repository/user_rapo.dart';

class UserController extends GetxController implements GetxService {
  final UserRapo userRapo;
  UserController({required this.userRapo});

  bool _isLoading = false;
  late UserModel _userModel;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  //  passing signup objects inside registration method
  Future<ResponseModel> getUserInfo() async {


    // sending this response to the server
    Response response = await userRapo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }



}
