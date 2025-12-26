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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Commerce App",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
            ),
            itemCount: homeController.productData.length,
            itemBuilder: (context, index) {
              ProductModel productModelData = homeController.productData[index];
              return Card(
                child: Column(
                  children: [
                    Image.network(productModelData.image!,height: 100,width: 100,fit: BoxFit.fill),
                    Text("Title is ${productModelData.title}",maxLines: 1,overflow: TextOverflow.ellipsis),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Title is ${productModelData.price}"),
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
    );
  }
}
