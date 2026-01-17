// import 'package:e_commerce_app/view/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// class ECommerce extends StatelessWidget {
//   const ECommerce({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

import 'package:e_commerce_app/signin_signup/email_adress_screen.dart';
import 'package:e_commerce_app/signin_signup/pin_verification_screen.dart';
import 'package:e_commerce_app/signin_signup/set_password_screen.dart';
import 'package:e_commerce_app/signin_signup/signin_screen.dart';
import 'package:e_commerce_app/signin_signup/signup_screen.dart';
import 'package:e_commerce_app/splash_screen.dart';
import 'package:e_commerce_app/view/main_navigator_screen.dart';
import 'package:e_commerce_app/view/profile_update_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});
  static GlobalKey<NavigatorState>navigator=GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(titleLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),

          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.grey[350],
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:Colors.greenAccent,width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:Colors.greenAccent,width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:Colors.greenAccent,width: 2),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                // fixedSize: Size(double.infinity, 15),
                minimumSize: Size(double.infinity, 40)
            ),
          )
      ),
      // home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/':(context)=>SplashScreen(),
        SignInScreen.name:(context)=>SignInScreen(),
        EmailAddressScreen.name:(context)=>EmailAddressScreen(),
        PinVerificationScreen.name:(context)=>PinVerificationScreen(),
        SetPasswordScreen.name:(context)=>SetPasswordScreen(),
        SignUpScreen.name:(context)=>SignUpScreen(),
        MainNavigatorScreen.name:(context)=>MainNavigatorScreen(),
        //AddNewTask.name:(context)=>AddNewTask(),
        ProfileUpdateScreen.name:(context)=>ProfileUpdateScreen()
      },
    );
  }
}
