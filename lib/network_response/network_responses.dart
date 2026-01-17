import 'dart:convert';

import 'package:http/http.dart';

class NetworkResponses {
  final bool isSuccess;
  final int statusCode;
  final dynamic body;
  final String? error;
  NetworkResponses({required this.isSuccess, required this.statusCode, this.body, this.error});
}

class NetworkCallers{
  static final String errorMessage="something wrong!";

  static Future<NetworkResponses>getApiCall({required String url})async{
    Uri uri=Uri.parse(url);
    Response response =await get(
      uri,
      // headers: {
      //   'Accept': 'application/json',
      //   'User-Agent': 'Mozilla/5.0',
      // },
    );
    if(response.statusCode==200){
      final decodedData=jsonDecode(response.body);
      return NetworkResponses(isSuccess: true, statusCode: response.statusCode,body: decodedData);
    }
    else{
      final decodedData=jsonDecode(response.body);
      return NetworkResponses(isSuccess: false, statusCode: response.statusCode,body: decodedData,error: decodedData?? errorMessage);
    }
  }

}