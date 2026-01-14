import 'package:flutter/material.dart';
import '../signin_signup/signin_screen.dart';

class RichText1 extends StatelessWidget {
  final String text1;
  final String? text2;
  final VoidCallback? onTap;

  const RichText1({
    super.key,
    required this.text1,
    this.text2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text1,
          style: const TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: onTap ?? () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
            Navigator.pushReplacementNamed(context, SignInScreen.name);
          },
          child: Text(
            text2 ?? " Sign in",
            style: const TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
