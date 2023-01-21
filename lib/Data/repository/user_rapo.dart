import 'package:food_full_app/Data/Api/Api_client.dart';
import 'package:food_full_app/app_constants.dart';
import 'package:get/get.dart';

class UserRapo {
 final ApiClient apiClient;
 UserRapo({required this.apiClient});
Future<Response>getUserInfo() async{
 return await apiClient.getData(AppConstants.USER_INFO_URI);
}

}