import 'package:autoyard/View/Auth/Login_Screen.dart';
import 'package:autoyard/View/Auth/Sign_Up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Widgets/Widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {

    return  WillPopScope(

        onWillPop: () async {
      // Return false to prevent back navigation
      return false;
        },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height*0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
                  Image.asset('assets/images/Rectangle 2.png',
                fit: BoxFit.fill,),
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,top: 25,right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 255,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Start ',
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
                              text: 'Getting \npickup',
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
                              text: ' notifications',
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
                      height: Get.height*0.01,
                    ),
                    SizedBox(
                      width: 249,
                      child: Text(
                        'Easy way to get car details',
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
                    SizedBox(
                      height: Get.height*0.09,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap:(){
                            Get.to(SignUp());
              },
                            child: Application_Button('Create an Account'))
                      ],
                    ),
                    SizedBox(
                      height: Get.height*0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text('Already have an account?',
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
                            child: Text('Sign in',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
