import 'dart:async';

import 'package:e_commerce_app/signin_signup/signin_screen.dart';
import 'package:e_commerce_app/view/main_navigator_screen.dart';
import 'package:flutter/material.dart';

import 'network_response/auth_controller.dart';
class SplashScreen extends StatefulWidget {
  static final String name="SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 3), (){
    //   Navigator.pushReplacementNamed(context, SignInScreen.name);
    // });
    _moveNextScreen();
  }

  Future<void>_moveNextScreen()async{
    await Future.delayed(Duration(seconds: 3));
    bool isUserLoggedIn= await AuthController.userLogin();
    if(isUserLoggedIn){
      Navigator.pushReplacementNamed(context, MainNavigatorScreen.name);
    }
    else{
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/pic.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'E-Commerce',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
    );
  }
}
