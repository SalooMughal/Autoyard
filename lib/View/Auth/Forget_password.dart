import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Sign_Up.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email_controller=TextEditingController();
  @override
  RxBool isloading=false.obs;
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h,),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 255,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Forgot \n',
                              style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 28,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: 'Password!',
                              style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 28,
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
                    SizedBox(height: 10.h,),
                    SizedBox(
                      width: 249,
                      child: Text(
                        'Please enter your Email to reset your Password.',
                        style: TextStyle(
                          color: Color(0xFF004968),
                          fontSize: 18,
                          fontFamily: 'Product Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),  SizedBox(height: 50.h,),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.sp,right: 20.sp),
                child: Column(
                  children: [
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
                      height: 200.h,
                    ),
                    Obx(()=>
                       isloading.value?CircularProgressIndicator():GestureDetector(
                        onTap: ()async{
                          isloading.value=true;
                          await Api_Interface().ForgetPassword(email_controller.text);
                          isloading.value=false;
                        },
                          child: Application_Button('Continoue')),
                    ),
                    SizedBox(
                      height: 20.h,
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
            ],
          ),
        ),
      ),
    );
  }
}
