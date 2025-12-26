import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void cmSnackBar({BuildContext? context,String? message}){
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(message!)));
}
Center cmCircularProgress(){
  return Center(
    child: CircularProgressIndicator(),
  );
}
Expanded cmShimmer() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.yellow.shade100,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
        ),
      ),
    ),
  );
}
