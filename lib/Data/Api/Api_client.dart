import 'package:food_full_app/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Api client has two bodies for get and post request.

class ApiClient extends GetConnect implements GetxService{
  late String token ;    // removed the late
  final String appBasedUrl;
  late SharedPreferences sharedPreferences;

  // this is server url

  late Map<String,String> _mainHeaders;


ApiClient({required this.appBasedUrl, required this.sharedPreferences}){
  baseUrl = appBasedUrl;
  timeout = Duration(seconds: 30);
  token = sharedPreferences.getString(AppConstants.TOKEN)??"";
  _mainHeaders = {
    'Content_Type' : 'application/json; charset = UTF-8',
    'Authorization' : 'Bearer $token',
  };
}
  void updateHeader(String token){
    _mainHeaders = {
      'Content_Type' : 'application/json; charset = UTF-8',
      'Authorization' : 'Bearer $token',
    };

}

Future <Response > getData(String uri,{ Map<String , String>? headers }) async {
  try {
     Response response = await get(uri,headers: headers ?? _mainHeaders
     );
     return response;

  } catch(e){
    return Response(statusCode: 1 , statusText: e.toString());

  }

}


Future<Response>postData (String uri , dynamic body) async {
  print("This is post data "+body.toString());
  try{
    Response response  = await post(uri , body , headers: _mainHeaders);
    print(response.toString());
    return response ;
  }

  catch(e){
  print(e.toString());
  return Response(statusCode: 1 , statusText: e.toString());

  }
}









}
