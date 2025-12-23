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
          return ListView.builder(
            itemCount: homeController.productData.length,
            itemBuilder: (context, index) {
              ProductModel productModelData = homeController.productData[index];
              return Card(
                child: ListTile(
                  leading: Image.network(productModelData.image!,),
                  // leading: ClipRRect(
                  //   borderRadius: BorderRadiusGeometry.circular(15),
                  //   child: Image.network(productModelData.image!,height: 100,width: 100,fit: BoxFit.cover,),
                  // ),
                  title: Text("Title is ${productModelData.title}"),
                  subtitle: Text(
                    "Description is ${productModelData.description}",
                  ),
                ),
              );
              // return null;
            },
          );
        },
      ),
    );
  }
}
