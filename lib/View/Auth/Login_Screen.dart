import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/View/Auth/Forget_password.dart';
import 'package:autoyard/View/Auth/Sign_Up.dart';
import 'package:autoyard/View/HomeScreen/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Widgets/Widgets.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  RxBool isloading=false.obs;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height*0.1,
                ),
                SizedBox(
                  width: 255,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hey,\n',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.24,
                          ),
                        ),
                        TextSpan(
                          text: 'Login ',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: 0.24,
                          ),
                        ),
                        TextSpan(
                          text: 'Now!',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            SizedBox(
              height: Get.height*0.1,
            ),
                Container(
                  alignment: Alignment.center,
                  width: 333.w,
                  height: 57.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  child: TextFormField(
                    controller: email_controller,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding:  EdgeInsets.all(10.sp),
                        child: SvgPicture.asset(
                          'assets/icons/email (2).svg',
                          height: 20.h, // Adjust height as needed
                          width: 20.w  // Adjust width as needed
                        ),
                      ),
                      hintText: 'Email Address',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 9.h), // Adjust top padding to align text with icon
                    ),
                    style: TextStyle(height: 1.5), // Adjust this value if necessary
                  ),
                ),
        
                SizedBox(
                  height: Get.height*0.01,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 333.w,
                  height: 57.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
        
                  ),
                  child: TextFormField(
                    controller: password_controller,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Container(

                          padding:  EdgeInsets.all(10.sp), // Adjust padding as needed
                          child: SvgPicture.asset(
                            'assets/icons/password.svg',
                            height: 20.h, // Adjust height as needed
                            width: 20.w, // Adjust width as needed
                          ),
                        ),
                        contentPadding: EdgeInsets.only(top: 9.h), // Adjust top padding to align text with icon
        
                        hintText: 'Enter Password',
                        // To hide the password text

                        border: InputBorder.none
                    ),
                  ),),
                SizedBox(
                  height: Get.height*0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: (){
                          Get.to(ForgetPassword());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFF004968),
                            fontSize: 14,
                            fontFamily: 'Product Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height*0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(()=>
                       isloading.value?CircularProgressIndicator():InkWell(
                           splashColor: Colors.transparent,   // Disable splash effect
                           highlightColor: Colors.transparent,
                        onTap: ()async{
                          isloading.value=true;
        
                          await Api_Interface().authenticateUser(email_controller.text.toString(), password_controller.text.toString());
        
                          isloading.value=false;
        
                        },
                          child: Application_Button('Login Account')),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height*0.05,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text("Don't have account?",
                        style: TextStyle(
                          color: Color(0xFF004968),
                          fontSize: 14,
                          fontFamily: 'Product Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.14,
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: InkWell(
                          onTap: (){
                            Get.to(SignUp());
                          },
                          child: Text('Signup here',
                            style: TextStyle(
                              color: Color(0xFF0DB0F4),
                              fontSize: 14,
                              fontFamily: 'Product Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.14,
                            ),),
                        ),
                      ),
        
                    ]),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
