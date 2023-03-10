import 'package:food_full_app/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/signup_body.dart';
import '../Api/Api_client.dart';

class AuthRapo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRapo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUpBody.toJson());
    // the object signUpBody will be converted into json
  }
 bool userLoggedIn()  {
    return  sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
   return await  sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }


  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URI, {"email": email, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberandPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }
  bool clearSharedData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = " ";
    apiClient.updateHeader(" ");
    return true;

  }


}
