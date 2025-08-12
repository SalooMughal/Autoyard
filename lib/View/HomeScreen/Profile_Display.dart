import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/CommonController/CommonController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Profile_Edit.dart';

class ProfileDisplay extends StatefulWidget {
  const ProfileDisplay({super.key});

  @override
  State<ProfileDisplay> createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  @override
  CommonContoller commonContoller=Get.find<CommonContoller>();
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Color(0xFFC5C5C5), // Color of the line
            height: 1.0, // Height of the line
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
             Get.to(ProfileEdit());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Color(0xFF004968),
                  fontSize: 20,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.20,
                ),
              ),
            ),
          ),
        ],
        title: Column(
          children: [

          ],
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/profile (3).svg'),

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(50),
              //   child: Obx(()=>
              //      commonContoller.user_Image.value.isNotEmpty
              //         ? Image.network(
              //       '${commonContoller.user_Image.value}',
              //       height: 60.h,
              //       width: 65.w,
              //       fit: BoxFit.fill,
              //     )
              //         : Icon(
              //       Icons.person, // You can replace this with any other default icon
              //       size: 60.h, // Adjust size as needed
              //       color: Colors.grey, // Adjust color as needed
              //     ),
              //   ),
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${commonContoller.user_First_name.value}',
                    style: TextStyle(
                      color: Color(0xFF004968),
                      fontSize: 16,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Autoyard Driver',
                    style: TextStyle(
                      color: Color(0xFF004968),
                      fontSize: 12,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 50.h,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,bottom: 10),
            child: Text(
              'Information',
              style: TextStyle(
                color: Color(0xFF004968),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.14,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 317.w,
                height: 60.h,
                child: ListTile(
                    subtitle: Text(
                      '${commonContoller.user_Phone_No.value}',
                      style: TextStyle(
                        color: Color(0xFF004968),
                        fontSize: 14.sp,
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.14,
                      ),
                    ),
                    title: Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Color(0xFF004968),
                        fontSize: 10.sp,
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.10,
                      ),
                    )),
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 317.w,
                height: 60.h,
                child: ListTile(
                    subtitle: Text(
                      '${commonContoller.user_email.value}',
                      style: TextStyle(
                        color: Color(0xFF004968),
                        fontSize: 14.sp,
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.14,
                      ),
                    ),
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: Color(0xFF004968),
                        fontSize: 10.sp,
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.10,
                      ),
                    )),
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
