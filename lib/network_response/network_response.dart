import 'dart:convert';

import 'package:http/http.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic body;
  final String? error;
  NetworkResponse({required this.isSuccess, required this.statusCode, this.body, this.error});
}

class NetworkCaller{
  static final String errorMessage="something wrong!";

  static Future<NetworkResponse>getApiCall({required String url})async{
    Uri uri=Uri.parse(url);
    Response response =await get(uri);
    if(response.statusCode==200){
      final decodedData=jsonDecode(response.body);
      return NetworkResponse(isSuccess: true, statusCode: response.statusCode,body: decodedData);
    }
    else{
      final decodedData=jsonDecode(response.body);
      return NetworkResponse(isSuccess: false, statusCode: response.statusCode,body: decodedData,error: decodedData?? errorMessage);
    }
  }

}