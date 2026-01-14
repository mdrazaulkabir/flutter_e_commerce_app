import 'package:e_commerce_app/signin_signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../all_urls/all_url.dart';
import '../custom_method/cm_class.dart';
import '../custom_widget/rich_text1.dart';
import '../model_class/user_model.dart';
import '../network_response/auth_controller.dart';
import '../network_response/network_response.dart';
import '../view/main_navigator_screen.dart';
import 'email_adress_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static final String name='signInScreen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailTEController=TextEditingController();
  final TextEditingController passwordTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  bool signInProgressIndicator=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Get Started With",
                  style: TextTheme.of(context).titleLarge,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: emailTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your email"),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter your valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: passwordTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your password"),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter your valid password";
                    }
                    else if(value.length <6 || value.length>12){
                      return "Password must be 6 to 12 character!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text("Login"),
                // ),
                Visibility(
                  visible: signInProgressIndicator==false,
                  replacement:CMCircularProgress(),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _loginButton();
                    },
                    label: Text("Login"),
                    icon: Icon(Icons.login),
                  ),
                ),
                SizedBox(height: 50),


                TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailAddressScreen()));
                    _forgetButton();
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 7),
                RichText1(
                  text1: "Don't have account?",
                  text2: " Sign up",
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()),);
                    _signUPButton();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginButton(){
    if(_formKey.currentState!.validate()){
      _Login();
    }
  }

  Future<void>_Login()async{
    signInProgressIndicator=true;
    setState(() {});
    Map<String,dynamic>requestBody={
      "email": emailTEController.text.trim(),
      "password": passwordTEController.text.trim(),
    };
    NetworkResponse response=await NetworkCaller.postData(url: '${AllUrl.loginUrl}', body: requestBody,isLoggedIn: true);
    if(response.isSuccess){
      UserModel userModel1=UserModel.fromJson(response.body!['data']);
      //print('so there is no data fetch by sharePreference########## $userModel1');
      String token1=response.body!['token'];
      //print("so really there is no token ##########$token1");
      await AuthController.saveUserData(userModel1, token1);
      Navigator.pushReplacementNamed(context, MainNavigatorScreen.name);
    }
    else{
      signInProgressIndicator=false;
      setState(() {});
      CMSnackBar(context, response.errorMessage.toString());
    }
  }


  void _forgetButton(){
    Navigator.pushReplacementNamed(context, EmailAddressScreen.name);
  }
  void _signUPButton(){
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
  }

}