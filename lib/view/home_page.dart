import 'package:e_commerce_app/custom_method/custom_method.dart';
import 'package:e_commerce_app/getx_controller/home_controller.dart';
import 'package:e_commerce_app/model_class/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  //bool productInProgress=false;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Commerce App",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(
              height: size.height*.05,
              child: GetBuilder<HomeController>(
                builder: (_) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:homeController.categoryList.length,
                      itemBuilder: (context, index) {
                        final category=homeController.categoryList[index];
                        final isSelected=homeController.selectedCategory==category;
                        return GestureDetector(
                          onTap: (){
                            homeController.filteredByCategory(category);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: isSelected? Colors.greenAccent:Colors.grey,
                                borderRadius: BorderRadiusGeometry.circular(5)
                            ),
                            child: Align(alignment: Alignment.center,child: Text(category,style: TextStyle(fontWeight: FontWeight.bold),)),
                          ),
                        );
                      });
                }
              ),
            ),
            SizedBox(height: size.height*0.02),
            Expanded(
              child: GetBuilder<HomeController>(   //getBuilder used for update the
                builder: (_) {
                  if(homeController.isLoadingProducts){
                    return cmCircularProgress();
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: homeController.filteredData.length,
                    itemBuilder: (context, index) {
                      ProductModel productModelData = homeController.filteredData[index];
                      return Card(
                        child: Column(
                          children: [
                            Image.network(productModelData.image!,height: 100,width: 100,fit: BoxFit.fill),
                            Text("Title:${productModelData.title}",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Price is ${productModelData.price}"),
                              ],
                            )
                          ],
                        ),
                        // ListTile(
                        //   leading: Image.network(productModelData.image!),
                        //   // leading: ClipRRect(
                        //   //   borderRadius: BorderRadiusGeometry.circular(15),
                        //   //   child: Image.network(productModelData.image!,height: 100,width: 100,fit: BoxFit.cover,),
                        //   // ),
                        //   title: Text("Title is ${productModelData.title}"),
                        //   subtitle: Text(
                        //     "Description is ${productModelData.description}",
                        //   ),
                        // ),
                      );
                      // return null;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
