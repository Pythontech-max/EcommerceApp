import 'package:food_full_app/Data/repository/Auth_rapo.dart';
import 'package:food_full_app/models/auth_response_model.dart';
import 'package:food_full_app/models/signup_body.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRapo authRapo;
  AuthController({required this.authRapo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //  passing signup objects inside registration method
  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
   update();
    // sending this response to the server
    Response response = await authRapo.registration(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRapo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;   //
    update();
    return responseModel;
  }
  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();
    // sending this response to the server
    Response response = await authRapo.login(email, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {

      authRapo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberandPassword(String number, String password) {
    authRapo.saveUserNumberandPassword(number, password);
  }
  bool userLoggedIn()  {
    return  authRapo.userLoggedIn();
  }

  bool clearSharedData(){
    return authRapo.clearSharedData();
  }

}
