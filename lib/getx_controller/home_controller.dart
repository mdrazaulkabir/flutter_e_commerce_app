import 'package:e_commerce_app/all_urls/all_urls.dart';
import 'package:e_commerce_app/model_class/product_model.dart';
import 'package:e_commerce_app/network_response/network_responses.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // HomeServices homeServices=HomeServices();

  List<ProductModel>productData=[];
  List<ProductModel>filteredData=[];
  List<String>categoryList=[];
  String selectedCategory='Add';
  
  bool isLoadingProducts=false;

  @override
  void onInit() {
    //getAllCategory();
    getAllProducts();
    super.onInit();
  }

  void getAllProducts() async {
    try{
      isLoadingProducts=true;
      update();
      NetworkResponses response = await NetworkCallers.getApiCall(url: AllUrls.productsUrl);
          if(response.isSuccess){
          // final List<ProductModel>data=[];
            productData.clear();
            for(Map<String,dynamic>dataList in response.body){
             productData.add(ProductModel.fromJson(dataList));
            }
            //productData.addAll(data);
            _getCategoryFromProduct();
            debugPrint('successfully api called!\n'
                // '${productData}\n'
                '${response.body}\n'
            );
          }
          // else{
          //   CMSnackBar(context: context,message: 'failed');
          // }
    }catch(e){
      print(e);
    }
    finally{
              /*
         try {
         isLoading = true;
         update();
          // API call
        } catch (e) {
          // error
        } finally {
          isLoading = false;
          update();
        }
             */
      isLoadingProducts=false;
      update();
    }
  }


  void _getCategoryFromProduct(){
    categoryList.clear();
    categoryList.add('All');
    for(int i=0; i<productData.length; i++){
      String categories=productData[i].category??'';
      if(!categoryList.contains(categories)){
        categoryList.add(categories);
      }
    }
    filteredData=List.from(productData);
  }


  void filteredByCategory(String category1){
    selectedCategory=category1;
    filteredData.clear();
    if(category1=="All"){
      // filteredData.add(productData);  //.add() one item
      filteredData.addAll(productData);  //.addAll() list of items
    }
    else{
      for(int i=0; i<productData.length; i++){
        if(productData[i].category==category1){
          filteredData.add(productData[i]);
        }
      }
    }
    update();
  }


}
