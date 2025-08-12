import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../Api_Inteferace/Api_Interface.dart';
import '../../Widgets/Widgets.dart';
import 'Login_Screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  TextEditingController first_name_controller=TextEditingController();
  TextEditingController last_name_controller=TextEditingController();
  TextEditingController activation_key_controller=TextEditingController();
  TextEditingController phone_controller=TextEditingController();
  TextEditingController confirm_password_controller=TextEditingController();
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
                          text: 'Signup Now! ',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: 0.24,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height*0.05,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 153.w,
                      height: 53.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: TextFormField(
                        controller: first_name_controller,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: SvgPicture.asset(
                              'assets/Signup_icons/p_profile.svg',
                              height: 20.h, // Adjust height as needed
                              width: 20.w,  // Adjust width as needed
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minHeight: 40.h, // Ensure icon is aligned with the text
                            minWidth: 40.w,  // Ensure icon is aligned with the text
                          ),
                          hintText: 'First Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15.h), // Align text with icon
                        ),
                        style: TextStyle(height: 1.5), // Ensure the text fits well within the container
                      ),
                    ),

                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 155.w,
                      height: 53.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                      child: TextFormField(
                        controller: last_name_controller,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: SvgPicture.asset(
                              'assets/Signup_icons/p_profile.svg',
                              height: 20.h, // Adjust height as needed
                              width: 20.w,  // Adjust width as needed
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minHeight: 40.h, // Ensures the icon is aligned with the text
                            minWidth: 40.w,  // Ensures the icon is aligned with the text
                          ),
                          hintText: 'Last Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15.h), // Align text with the icon
                        ),
                        style: TextStyle(height: 1.5), // Adjust line height for the text
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: Get.height*0.01,
                ),

                Container(
                  alignment: Alignment.center,
                  width: 333.w,
                  height: 53.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number, // Restrict to numeric input
                    controller: phone_controller,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.sp), // Adjust padding for the icon
                        child: SvgPicture.asset(
                          'assets/Signup_icons/phone.svg',
                          height: 20.h, // Adjust height as needed
                          width: 20.w,  // Adjust width as needed
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 40.h, // Adjust min height to better align icon with text
                        minWidth: 40.w,  // Adjust min width to better align icon with text
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h), // Adjust padding to align text vertically with the icon
                      hintText: 'Phone Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height*0.01,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 333.w,
                  height: 53.h,
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
                        padding: EdgeInsets.all(10.sp), // Adjust padding for the icon
                        child: SvgPicture.asset(
                          'assets/icons/email (2).svg',
                          height: 20.h, // Adjust height as needed
                          width: 20.w,  // Adjust width as needed
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 40.h, // Adjust to better align icon with text
                        minWidth: 40.w,  // Adjust to better align icon with text
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h), // Adjust padding to align text vertically with the icon
                      hintText: 'Enter Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),


                SizedBox(
                  height: Get.height*0.01,
                ),

                Container(
                  alignment: Alignment.center,
                  width: 333.w,
                  height: 53.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  child: TextFormField(
                    controller: password_controller,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.sp), // Adjust padding for the icon
                        child: SvgPicture.asset(
                          'assets/icons/password.svg',
                          height: 20.h, // Adjust height as needed
                          width: 20.w,  // Adjust width as needed
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 40.h, // Adjust to better align icon with text
                        minWidth: 40.w,  // Adjust to better align icon with text
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h), // Adjust padding to align text vertically with the icon
                      hintText: 'Enter Password',
                      border: InputBorder.none,
                    ),
                    obscureText: true, // To hide the password text
                  ),
                ),


                SizedBox(
                  height: Get.height*0.01,
                ),



                Container(
                  alignment: Alignment.center,
                  width: 333.w,
                  height: 53.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  child: TextFormField(
                    controller: confirm_password_controller,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.sp), // Adjust padding for the icon
                        child: SvgPicture.asset(
                          'assets/icons/password.svg',
                          height: 20.h, // Adjust height as needed
                          width: 20.w,  // Adjust width as needed
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 40.h, // Adjust to better align icon with text
                        minWidth: 40.w,  // Adjust to better align icon with text
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h), // Align the text with the icon
                      hintText: 'Password Confirmation',
                      border: InputBorder.none,
                    ),
                    obscureText: true, // To hide the password text
                  ),
                ),



                SizedBox(
                  height: Get.height*0.01,
                ),



                Container(
                  alignment: Alignment.center,
                  width: 333.w,
                  height: 53.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  child: TextFormField(
                    controller: activation_key_controller,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.sp), // Adjust padding for the icon
                        child: SvgPicture.asset(
                          'assets/Signup_icons/p_lock.svg',
                          height: 20.h, // Adjust height as needed
                          width: 20.w,  // Adjust width as needed
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 40.h, // Adjust to better align icon with text
                        minWidth: 40.w,  // Adjust to better align icon with text
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h), // Align text vertically with the icon
                      hintText: 'Activation Key',
                      border: InputBorder.none,
                    ),
                  ),
                ),


                SizedBox(
                  height: Get.height*0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(()=>
                    isloading.value?CircularProgressIndicator():GestureDetector(
                        onTap: ()async{
                          isloading.value=true;

                          await Api_Interface().Sign_up(first_name_controller.text, last_name_controller.text,phone_controller.text,email_controller.text,password_controller.text,confirm_password_controller.text,activation_key_controller.text);

                          isloading.value=false;

                        },
                        child: Application_Button('Create Account')),
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
                            Get.to(Login_Screen());
                          },
                          child: Text('Login here',
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
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
