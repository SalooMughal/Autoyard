import 'dart:async';
import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Email_Verification extends StatefulWidget {
  const Email_Verification({super.key});

  @override
  State<Email_Verification> createState() => _Email_VerificationState();
}

class _Email_VerificationState extends State<Email_Verification> {
  RxBool isLoading = false.obs;
  RxBool isButtonEnabled = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25.0.sp,right: 25.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 120.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Verify ',
                    style: TextStyle(
                      color: Color(0xFF252525),
                      fontSize: 24.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                  TextSpan(
                    text: 'Email',
                    style: TextStyle(
                      color: Color(0xFF252525),
                      fontSize: 24.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 303.w,
              child: Text(
                'Thank you for registering! To complete your registration and gain full access to our platform, please verify your email address.',
                style: TextStyle(
                  color: Color(0xFF004968),
                  fontSize: 14.sp,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              'Instructions',
              style: TextStyle(
                color: Color(0xFF004968),
                fontSize: 14.sp,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: 0.14,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 303.w,
              child: Text(
                'Check your email inbox for a verification email.\nClick on the verification link provided in email.\nOnce verified, you will be redirected back to our platform.',
                style: TextStyle(
                  color: Color(0xFF004968),
                  fontSize: 12.sp,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Didn’t receive the email? ',
              style: TextStyle(
                color: Color(0xFF004968),
                fontSize: 14.sp,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: 0.14,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 303.w,
              child: Text(
                'Check your spam/junk folder to verify.\nResend verification email by clicking the button below.',
                style: TextStyle(
                  color: Color(0xFF004968),
                  fontSize: 12.sp,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            SizedBox(height: 150.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: isButtonEnabled.value
                      ? () async {
                    isLoading.value = true;
                    isButtonEnabled.value = false;

                    await Api_Interface().EmailVerification();

                    isLoading.value = false;

                    // Disable the button for 10 seconds
                    Timer(Duration(seconds: 10), () {
                      isButtonEnabled.value = true;
                    });
                  }
                      : null,
                  child: Obx(() => Container(
                    width: Get.width*0.85,
                    height: 50.h,
                    decoration:
                     ShapeDecoration(
                      color:isButtonEnabled.value ? Color(0xFF0DB0F4):Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: isLoading.value
                        ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Text(
                      'Resend Verification Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.16,
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
