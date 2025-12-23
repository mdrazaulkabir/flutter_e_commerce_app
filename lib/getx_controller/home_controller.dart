import 'package:e_commerce_app/all_urls/all_urls.dart';
import 'package:e_commerce_app/model_class/product_model.dart';
import 'package:e_commerce_app/network_response/network_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // HomeServices homeServices=HomeServices();

  List<ProductModel>productData=[];
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  void getAllProducts() async {
    try{
      NetworkResponse response = await NetworkCaller.getApiCall(url: AllUrls.productsUrl);
          if(response.statusCode==200){
          // final List<ProductModel>data=[];
            for(Map<String,dynamic>dataList in response.body){
             productData.add(ProductModel.fromJson(dataList));
            }
            //productData.addAll(data);
            debugPrint('successfully api called!\n'
                '${productData}\n'
            );
            update();
          }
          // else{
          //   CMSnackBar(context: context,message: 'failed');
          // }
    }catch(e){
      print(e);
    }
  }
}
