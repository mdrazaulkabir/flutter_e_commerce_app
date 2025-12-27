import 'package:e_commerce_app/custom_method/custom_method.dart';
import 'package:flutter/material.dart';
class HomePageGridviewShimmer extends StatefulWidget {
  const HomePageGridviewShimmer({super.key});

  @override
  State<HomePageGridviewShimmer> createState() => _HomePageGridviewShimmerState();
}

class _HomePageGridviewShimmerState extends State<HomePageGridviewShimmer> {
  @override
  Widget build(BuildContext context) {
    //final size=MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  cmShimmer(),
                  cmShimmer()
                ],
              ),
              Row(
                children: [
                  cmShimmer(),
                  cmShimmer()
                ],
              ),
              Row(
                children: [
                  cmShimmer(),
                  cmShimmer()
                ],
              ),
              Row(
                children: [
                  cmShimmer(),
                  cmShimmer()
                ],
              ),
              Row(
                children: [
                  cmShimmer(),
                  cmShimmer()
                ],
              ),
              Row(
                children: [
                  cmShimmer(),
                  cmShimmer()
                ],
              ),
              Row(
                children: [
                  cmShimmer(),
                  cmShimmer()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
