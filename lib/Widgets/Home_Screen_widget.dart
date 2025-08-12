import 'dart:developer';

import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/CommonController/CommonController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../View/Auth/Auth_Screen.dart';
import '../View/HomeScreen/Profile_Display.dart';
import '../View/HomeScreen/ViewJobs.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CommonContoller commonContoller = Get.find<CommonContoller>();

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [

              FutureBuilder(
                future: Api_Interface().Get_All_Pickups(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While waiting for the data, show a loading indicator
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // If there's an error, display an error message
                    return Center(
                      child: Text('An error occurred: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData ||
                      snapshot.data['data'] == null ||
                      snapshot.data['data'].isEmpty) {
                    // If the data is null or empty, show a message indicating no data
                    return Center(
                      child: Text(
                        'No data available',
                        style: TextStyle(
                          color: Color(0xFF004968),
                          fontSize: 18,
                          fontFamily: 'Product Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  } else {
                    // Display the list if data is available
                    final response = snapshot.data;
                    return Column(
                      children: [
                        Column(
                          children: List.generate(
                            commonContoller.length_of_assign_car.value,
                                (index) {
                              RxBool isloading = false.obs;
                              RxBool isloading2 = false.obs;
                              RxBool isloading3 = false.obs;
                              log(response['data'][index]['id'].toString());

                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  width: 333.w,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF7F7F7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.0, right: 15, top: 12.sp),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${response['data'][index]['customer_name']}',
                                              style: TextStyle(
                                                color: Color(0xFF004968),
                                                fontSize: 15.sp,
                                                fontFamily: 'Product Sans',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                                letterSpacing: 0.18,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                log(response['data'][index]['id'].toString());
                                                Get.to(ViewJobs(
                                                  id: '${response['data'][index]['id']}',
                                                ));
                                              },
                                              child: Text(
                                                'View Job',
                                                style: TextStyle(
                                                  color: Color(0xFF0DB0F4),
                                                  fontSize: 12.sp,
                                                  fontFamily: 'Product Sans',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                  letterSpacing: 0.14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(20.0.sp),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/pickup.svg',
                                              height: 30,
                                              width: 30,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10.0.sp),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: 109,
                                                    child: Text(
                                                      'PICK UP',
                                                      style: TextStyle(
                                                        color: Color(0xFFBCC2CE),
                                                        fontSize: 14,
                                                        fontFamily: 'Product Sans',
                                                        fontWeight: FontWeight.w400,
                                                        height: 0,
                                                        letterSpacing: 0.14,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 109,
                                                    child: Text(
                                                      '${response['data'][index]['address']}',
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
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.0.sp),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/schedule.svg',
                                              height: 30,
                                              width: 30,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10.0.sp),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: 109,
                                                    child: Text(
                                                      'PICK TIME',
                                                      style: TextStyle(
                                                        color: Color(0xFFBCC2CE),
                                                        fontSize: 12.sp,
                                                        fontFamily: 'Product Sans',
                                                        fontWeight: FontWeight.w400,
                                                        height: 0,
                                                        letterSpacing: 0.14,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 109,
                                                    child: Text(
                                                      '${response['data'][index]['pickup_time']}',
                                                      style: TextStyle(
                                                        color: Color(0xFF004968),
                                                        fontSize: 12.sp,
                                                        fontFamily: 'Product Sans',
                                                        fontWeight: FontWeight.w400,
                                                        height: 0,
                                                        letterSpacing: 0.14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0.sp),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [

                                            Obx(
                                                  () => GestureDetector(
                                                onTap: () async {
                                                  Get.dialog(
                                                    AlertDialog(
                                                      backgroundColor: Colors.white,
                                                      actions: [
                                                        Container(
                                                          height: 190.h,
                                                          width: 300.w,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              SizedBox(height: 20.h,),
                                                              Text(
                                                                'Choose action to perform',
                                                                style: TextStyle(
                                                                  color: Color(0xFF004968),
                                                                  fontSize: 18,
                                                                  fontFamily: 'Product Sans',
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 0,
                                                                  letterSpacing: 0.18,
                                                                ),
                                                              ),
                                                              SizedBox(height: 10.h,),
                                                              Obx(
                                                                    () => GestureDetector(
                                                                  onTap: () async {
                                                                    isloading3.value = true;
                                                                    await Api_Interface().Update_Car_Status(
                                                                        response['data'][index]['id'].toString(),
                                                                        'pending');
                                                                    Navigator.pop(context);
                                                                    isloading3.value = false;
                                                                    setState(() {

                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    child: isloading3.value
                                                                        ? SpinKitCircle(
                                                                      size: 30,
                                                                      itemBuilder:
                                                                          (BuildContext context, int index) {
                                                                        return DecoratedBox(
                                                                          decoration: BoxDecoration(
                                                                            shape: BoxShape.circle,
                                                                            color: Colors.grey,
                                                                          ),
                                                                        );
                                                                      },
                                                                    )
                                                                        : Text(
                                                                      'Pending',
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 14,
                                                                        fontFamily: 'Product Sans',
                                                                        fontWeight: FontWeight.w700,
                                                                        height: 0,
                                                                        letterSpacing: 0.14,
                                                                      ),
                                                                    ),
                                                                    width: 252.w,
                                                                    height: 40.h,
                                                                    decoration: ShapeDecoration(
                                                                      color: isloading3.value
                                                                          ? Color(0xFFD9D9D9)
                                                                          : Color(0xFFFF9400),
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: 10.h,),
                                                              Obx(
                                                                    () => GestureDetector(
                                                                  onTap: () async {
                                                                    isloading2.value = true;
                                                                    await Api_Interface().Update_Car_Status(
                                                                        response['data'][index]['id'].toString(),
                                                                        'completed');
                                                                    Navigator.pop(context);
                                                                    isloading2.value = false;
                                                                    setState(() {

                                                                    });

                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    child: isloading2.value
                                                                        ? SpinKitCircle(
                                                                      size: 30,
                                                                      itemBuilder:
                                                                          (BuildContext context, int index) {
                                                                        return DecoratedBox(
                                                                          decoration: BoxDecoration(
                                                                            shape: BoxShape.circle,
                                                                            color: Colors.grey,
                                                                          ),
                                                                        );
                                                                      },
                                                                    )
                                                                        : Text(
                                                                      'Completed',
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 14,
                                                                        fontFamily: 'Product Sans',
                                                                        fontWeight: FontWeight.w700,
                                                                        height: 0,
                                                                        letterSpacing: 0.14,
                                                                      ),
                                                                    ),
                                                                    width: 252.w,
                                                                    height: 40.h,
                                                                    decoration: ShapeDecoration(
                                                                      color: isloading2.value
                                                                          ? Color(0xFFD9D9D9)
                                                                          : Color(0xFF28BA15),
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: 10.h,),
                                                              Obx(
                                                                    () => GestureDetector(
                                                                  onTap: () async {
                                                                    isloading.value = true;
                                                                    await Api_Interface().Update_Car_Status(
                                                                        response['data'][index]['id'].toString(),
                                                                        'cancelled');
                                                                    Navigator.pop(context);
                                                                    isloading.value = false;
                                                                    setState(() {

                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    child: isloading.value
                                                                        ? SpinKitCircle(
                                                                      size: 30,
                                                                      itemBuilder:
                                                                          (BuildContext context, int index) {
                                                                        return DecoratedBox(
                                                                          decoration: BoxDecoration(
                                                                            shape: BoxShape.circle,
                                                                            color: Colors.grey,
                                                                          ),
                                                                        );
                                                                      },
                                                                    )
                                                                        : Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 14,
                                                                        fontFamily: 'Product Sans',
                                                                        fontWeight: FontWeight.w700,
                                                                        height: 0,
                                                                        letterSpacing: 0.14,
                                                                      ),
                                                                    ),
                                                                    width: 252.w,
                                                                    height: 40.h,
                                                                    decoration: ShapeDecoration(
                                                                      color: isloading.value
                                                                          ? Color(0xFFD9D9D9)
                                                                          : Color(0xFFFF0000),
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );

                                                  // isloading3.value = true;
                                                  // await Api_Interface().Update_Car_Status(
                                                  //     response['data'][index]['id'].toString(),
                                                  //     'pending');
                                                  // isloading3.value = false;
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: isloading3.value
                                                      ? SpinKitCircle(
                                                    size: 30,
                                                    itemBuilder:
                                                        (BuildContext context, int index) {
                                                      return DecoratedBox(
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.grey,
                                                        ),
                                                      );
                                                    },
                                                  )
                                                      : Text(
                                                    '${response['data'][index]['status']}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily: 'Product Sans',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0,
                                                      letterSpacing: 0.14,
                                                    ),
                                                  ),
                                                  width: 300.w,
                                                  height: 40.h,
                                                  decoration: ShapeDecoration(
                                                    color: response['data'][index]['status']=='pending'?Color(0xFFFF9400):response['data'][index]['status']=='cancelled'?Colors.red:response['data'][index]['status']=='completed'?Colors.green:Colors.transparent,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );

                  }
                },
              ),


        ],
      ),
    );
  }
}



Widget Profile() {
  CommonContoller commonContoller = Get.find<CommonContoller>();
  Future<void> launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Use this for better reliability
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  return SingleChildScrollView(
    child: ConstrainedBox(
      constraints: BoxConstraints(

      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            FutureBuilder(
              future: Api_Interface().Get_User_Details(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('An error occurred: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data['data'] == null) {
                  return Center(
                    child: Text(
                      'No user details available',
                      style: TextStyle(
                        color: Color(0xFF004968),
                        fontSize: 18,
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                } else {
                  final response = snapshot.data;
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProfileDisplay());
                    },
                    child: Container(
                      width: 333.w,
                      height: 100.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/images/profile (3).svg'),

                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(50),
                                  //   child: Obx(
                                  //         () => commonContoller.user_Image.value.isNotEmpty
                                  //         ? Image.network(
                                  //       '${commonContoller.user_Image.value}',
                                  //       height: 60.h,
                                  //       width: 65.w,
                                  //       fit: BoxFit.fill,
                                  //       loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  //         if (loadingProgress == null) {
                                  //           return child; // Image is fully loaded
                                  //         } else {
                                  //           return Center(
                                  //             child: CircularProgressIndicator(
                                  //               value: loadingProgress.expectedTotalBytes != null
                                  //                   ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                  //                   : null,
                                  //             ),
                                  //           );
                                  //         }
                                  //       },
                                  //       errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  //         return Icon(
                                  //           Icons.error,
                                  //           size: 60.h,
                                  //           color: Colors.red,
                                  //         );
                                  //       },
                                  //     )
                                  //         : Icon(
                                  //       Icons.person,
                                  //       size: 60.h,
                                  //       color: Colors.grey,
                                  //     ),
                                  //   ),
                                  // ),

                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.0.sp),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${response['data']['user']['first_name']}',
                                          style: TextStyle(
                                            color: Color(0xFF004968),
                                            fontSize: 16.sp,
                                            fontFamily: 'Product Sans',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                            letterSpacing: 0.16,
                                          ),
                                        ),
                                        Text(
                                          'Autoyard Driver',
                                          style: TextStyle(
                                            color: Color(0xFF004968),
                                            fontSize: 12.sp,
                                            fontFamily: 'Product Sans',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                            letterSpacing: 0.12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 15.0.sp),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xFF004968),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 10.h),
            Container(
              alignment: Alignment.centerLeft,
              width: 333.w,
              decoration: ShapeDecoration(
                color: Color(0xFFF7F7F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0.sp, right: 20.sp, top: 20.sp),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Review',
                  //         style: TextStyle(
                  //           color: Color(0xFF004968),
                  //           fontSize: 14.sp,
                  //           fontFamily: 'Product Sans',
                  //           fontWeight: FontWeight.w400,
                  //           height: 0,
                  //           letterSpacing: 0.14,
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.arrow_forward_ios_rounded,
                  //         color: Color(0xFF004968),
                  //         size: 20,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 0.0.sp, right: 0.sp, top: 5.sp),
                  //   child: Container(
                  //     width: 280.w,
                  //     child: Divider(
                  //       thickness: 2.0,
                  //       color: Color(0xFFF1F0F6),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0.sp, right: 20.sp, top: 10.sp),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Help & Support',
                  //         style: TextStyle(
                  //           color: Color(0xFF004968),
                  //           fontSize: 14.sp,
                  //           fontFamily: 'Product Sans',
                  //           fontWeight: FontWeight.w400,
                  //           height: 0,
                  //           letterSpacing: 0.14,
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.arrow_forward_ios_rounded,
                  //         color: Color(0xFF004968),
                  //         size: 20,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 0.0.sp, right: 0.sp, top: 5.sp),
                  //   child: Container(
                  //     width: 280.w,
                  //     child: Divider(
                  //       thickness: 2.0,
                  //       color: Color(0xFFF1F0F6),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.sp, right: 20.sp, top: 15.sp),
                    child: InkWell(
                      onTap: () async {
                        await launchURL('https://autoyard.com.au/privacy-policy');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Color(0xFF004968),
                              fontSize: 14.sp,
                              fontFamily: 'Product Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.14,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xFF004968),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
            SizedBox(height: 180.h), // Pushes the logout button to the bottom
            GestureDetector(
              onTap: () async {
                commonContoller.bearertoken.value = '';
                final box = await Hive.openBox('Credentials');
                box.clear();
                commonContoller.logout();
                Get.to(AuthScreen());
              },
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                width: Get.width * 0.4,
                decoration: ShapeDecoration(
                  color: Color(0xFF0DB0F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.16,
                  ),
                ),
              ),
            ),
            TextButton(onPressed: ()async{
              try {

                await launchURL('https://app.autoyard.com.au/delete-account');
              } catch (e) {
                print('Error: $e');
              }

            }, child: Text('Delete Account',style: TextStyle(
                fontFamily: 'Product Sans',
              color: Colors.red
            ),)),
            SizedBox(height: 10.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'App Version ',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.14,
                    ),
                  ),
                  TextSpan(
                    text: '1.0.0',
                    style: TextStyle(
                      color: Color(0xFF0DB0F4),
                      fontSize: 14,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    ),
  );

}
