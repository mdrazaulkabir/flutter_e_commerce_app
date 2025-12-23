import 'package:e_commerce_app/all_urls/all_urls.dart';
import 'package:e_commerce_app/network_response/network_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // HomeServices homeServices=HomeServices();


  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  void getAllProducts() async {
    try{
      NetworkResponse response = await NetworkCaller.getApiCall(url: AllUrls.productsUrl);
          if(response.statusCode==200){
            debugPrint('successfully api called!');
            print(response.body);
          }
          // else{
          //   CMSnackBar(context: context,message: 'failed');
          // }
    }catch(e){
      print(e);
    }
  }
}
