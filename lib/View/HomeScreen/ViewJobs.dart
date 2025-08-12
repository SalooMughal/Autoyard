import 'dart:developer';

import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Add to car.dart';

class ViewJobs extends StatefulWidget {
  String id;
   ViewJobs({super.key, required this.id});

  @override
  State<ViewJobs> createState() => _ViewJobsState();
}

class _ViewJobsState extends State<ViewJobs> {
  @override
  void _launchDialer(String phoneNumber) async {
    final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      // bottomNavigationBar:   GestureDetector(
      //   onTap: (){
      //     Get.to(Add_to_Car());
      //   },
      //   child: Container(
      //     alignment: Alignment.center,
      //     color: Color(0xFF0DB0F4),
      //     height: 110.h,
      //     child:Text(
      //       'Go to Pickup',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 18,
      //         fontFamily: 'Product Sans',
      //         fontWeight: FontWeight.w700,
      //         height: 0,
      //         letterSpacing: 0.18,
      //       ),
      //     ),
      //
      //   ),
      // ),
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Color(0xFFC5C5C5), // Color of the line
            height: 1.0, // Height of the line
          ),
        ),


        title:  Column(
          children: [
          Text(
          'View Job',
          style: TextStyle(
            color: Color(0xFF004968),
            fontSize: 20,
            fontFamily: 'Product Sans',
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 0.20,
          )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 8),
          child: FutureBuilder(
            future: Api_Interface().Get_detail_Single_Pickup(widget.id),
            builder: (context, snapshot){
              if(snapshot.hasData){
                final response=snapshot.data;
                log('response ${response}');
                return Column(
                  children: [
                    Padding(
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

                              padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${response['data']['customer_name']}',
                                    style: TextStyle(
                                      color: Color(0xFF004968),
                                      fontSize: 18,
                                      fontFamily: 'Product Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 0.18,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      // Get.to(ViewJobs());
                                    },
                                    child:  Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/location.svg'),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '2.2km',
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
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding:  EdgeInsets.only(left: 20.0.sp,right:20.0.sp,top: 10.sp,bottom: 5.sp ),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/pickup.svg',
                                    height: 30,
                                    width: 30,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.0.sp),
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
                                            '${response['data']['address']}',
                                            style: TextStyle(
                                              color: Color(0xFF0DB0F4),
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
                              padding:  EdgeInsets.only(left: 40.0.sp),
                              child: Container(
                                width: 250.w,
                                child: Divider(
                                  thickness: 2.0,
                                  color: Color(0xFFF1F0F6),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 10.0.sp),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 20.0.sp),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/Toyota.svg',
                                          height: 30,
                                          width: 30,),
                                        Padding(
                                          padding:  EdgeInsets.only(left: 10.0.sp),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  'MAKE',
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
                                                  '${response['data']['brand']['name']}',
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
                                    padding:  EdgeInsets.only(left: 20.0.sp),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/car.svg',
                                          height: 30,
                                          width: 30,),
                                        Padding(
                                          padding:  EdgeInsets.only(left: 10.0.sp),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  'MODEL',
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
                                                  '${response['data']['model']['name']}',
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
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 40.0.sp,top: 10.sp),
                              child: Container(
                                width: 250.w,
                                child: Divider(
                                  thickness: 2.0,
                                  color: Color(0xFFF1F0F6),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 10.0.sp),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 20.0.sp),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/Toyota.svg',
                                          height: 30,
                                          width: 30,),
                                        Padding(
                                          padding:  EdgeInsets.only(left: 10.0.sp),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  'CAR PRICE',
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
                                                  '${response['data']['price']}',
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
                                    padding:  EdgeInsets.only(left: 20.0.sp),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/car (1).svg',
                                          height: 30,
                                          width: 30,),
                                        Padding(
                                          padding:  EdgeInsets.only(left: 10.0.sp),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  'BUILT',
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
                                                  '${response['data']['year']}',
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
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 40.0.sp,top: 10.sp),
                              child: Container(
                                width: 250.w,
                                child: Divider(
                                  thickness: 2.0,
                                  color: Color(0xFFF1F0F6),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 10.0.sp),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 20.0.sp),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/dollars.svg',
                                          height: 30,
                                          width: 30,),
                                        Padding(
                                          padding:  EdgeInsets.only(left: 10.0.sp),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  'PAYMENT TYPE',
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
                                                  '${response['data']['payment_method']}',
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

                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 40.0.sp,top: 10.sp),
                              child: Container(
                                width: 250.w,
                                child: Divider(
                                  thickness: 2.0,
                                  color: Color(0xFFF1F0F6),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 10.0.sp),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 20.0.sp),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/schedule.svg',
                                          height: 30,
                                          width: 30,),
                                        Padding(
                                          padding:  EdgeInsets.only(left: 10.0.sp),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  'PICKUP TIME',
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
                                                  '${response['data']['pickup_time']}',
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
                                              SizedBox(height: 10.h,)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 333.w,
                      height: 100.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notes',
                              style: TextStyle(
                                color: Color(0xFF004968),
                                fontSize: 18,
                                fontFamily: 'Product Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: 0.18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Text(
                                '${response['data']['note']}',
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
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 333.w,
                      height: 140.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact',
                              style: TextStyle(
                                color: Color(0xFF004968),
                                fontSize: 18,
                                fontFamily: 'Product Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: 0.18,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 15.0.sp),
                              child:  GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(

                                        actions: <Widget>[
                                          Container(
                                            height: 100,
                                            alignment:Alignment.center,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                     _launchDialer(response['data']['phone_number']);
                                                  },
                                                    child: Text('${response['data']['phone_number']}')),
                                              ],
                                            )
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/icons/call.svg'),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          'Make a Call Now',
                                          style: TextStyle(
                                            color: Color(0xFF838383),
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
                                  width: 309.w,
                                  height: 44.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
              }else return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
