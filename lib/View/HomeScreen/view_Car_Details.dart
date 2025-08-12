import 'dart:developer';
import 'dart:ui';

import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewCarDetails extends StatefulWidget {
  const ViewCarDetails({super.key});

  @override
  State<ViewCarDetails> createState() => _ViewCarDetailsState();
}

class _ViewCarDetailsState extends State<ViewCarDetails> {
  @override
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

        title:  Column(
          children: [
            Text(
              'Car Details',
              style: TextStyle(
                color: Color(0xFF004968),
                fontSize: 20,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: 0.20,
              ),
            ),
          ],
        ),
      ),
      body:Padding(
        padding:  EdgeInsets.only(left: 15.0,right: 15),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: Api_Interface().Get_View_Car_Details(),
            builder: (context, snapshot){
             if(snapshot.hasData){
               final response=snapshot.data;

               return  Column (
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 20.h,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'Business Name',
                         style: TextStyle(
                           color: Color(0xFFC6C6C6),
                           fontSize: 10,
                           fontFamily: 'Product Sans',
                           fontWeight: FontWeight.w400,
                           height: 0,
                           letterSpacing: 0.10,
                         ),
                       ),
                       SizedBox(height: 5.h,),
                       Container(
                         width: 350.w,
                         height: 42.h,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Text(
                                 '${response['business_name']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15.h,),
                       Text(
                         'Phone Number',
                         style: TextStyle(
                           color: Color(0xFFC6C6C6),
                           fontSize: 10,
                           fontFamily: 'Product Sans',
                           fontWeight: FontWeight.w400,
                           height: 0,
                           letterSpacing: 0.10,
                         ),
                       ),
                       SizedBox(height: 5.h,),
                       Container(
                         width: 350.w,
                         height: 42.h,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Text(
                                 '${response['phone_number']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15.h,),
                       Text(
                         'ABN/ACN no.',
                         style: TextStyle(
                           color: Color(0xFFC6C6C6),
                           fontSize: 10,
                           fontFamily: 'Product Sans',
                           fontWeight: FontWeight.w400,
                           height: 0,
                           letterSpacing: 0.10,
                         ),
                       ),
                       SizedBox(height: 5.h,),
                       Container(
                         width: 350.w,
                         height: 42.h,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Text(
                                 '${response['abn_number']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15.h,),
                       Text(
                         'License Number',
                         style: TextStyle(
                           color: Color(0xFFC6C6C6),
                           fontSize: 10,
                           fontFamily: 'Product Sans',
                           fontWeight: FontWeight.w400,
                           height: 0,
                           letterSpacing: 0.10,
                         ),
                       ),
                       SizedBox(height: 5.h,),
                       Container(
                         width: 350.w,
                         height: 42.h,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Text(
                                 '${response['license_number']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15.h,),
                       Text(
                         'Date of Birth',
                         style: TextStyle(
                           color: Color(0xFFC6C6C6),
                           fontSize: 10,
                           fontFamily: 'Product Sans',
                           fontWeight: FontWeight.w400,
                           height: 0,
                           letterSpacing: 0.10,
                         ),
                       ),
                       SizedBox(height: 5.h,),
                       Container(
                         width: 350.w,
                         height: 42.h,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Text(
                                 '${response['date_of_birth']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15.h,),
                       Text(
                         'Pickup Date',
                         style: TextStyle(
                           color: Color(0xFFC6C6C6),
                           fontSize: 10,
                           fontFamily: 'Product Sans',
                           fontWeight: FontWeight.w400,
                           height: 0,
                           letterSpacing: 0.10,
                         ),
                       ),
                       SizedBox(height: 5.h,),
                       Container(
                         width: 350.w,
                         height: 42.h,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Text(
                                 '${response['pickup_date']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15.h,),
                       Text(
                         'Pickup Address',
                         style: TextStyle(
                           color: Color(0xFFC6C6C6),
                           fontSize: 10,
                           fontFamily: 'Product Sans',
                           fontWeight: FontWeight.w400,
                           height: 0,
                           letterSpacing: 0.10,
                         ),
                       ),
                       SizedBox(height: 5.h,),
                       Container(
                         width: 350.w,
                         height: 42.h,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Text(
                                 '${response['pickup_address']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15.h,),
                       Text(
                         'Residential Address',
                         style: TextStyle(
                           color: Color(0xFFC6C6C6),
                           fontSize: 10,
                           fontFamily: 'Product Sans',
                           fontWeight: FontWeight.w400,
                           height: 0,
                           letterSpacing: 0.10,
                         ),
                       ),
                       SizedBox(height: 5.h,),
                       Container(
                         width: 350.w,
                         height: 42.h,
                         clipBehavior: Clip.antiAlias,
                         decoration: ShapeDecoration(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                             borderRadius: BorderRadius.circular(8),
                           ),
                         ),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Text(
                                 '${response['residential_address']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   SizedBox(
                     height: 20.h,
                   ),
                   Container(
                     width: 350.w,

                     decoration: ShapeDecoration(
                       color: Colors.white,
                       shape: RoundedRectangleBorder(
                         side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                         borderRadius: BorderRadius.circular(8),
                       ),
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(
                           height: 20.h,
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 0.0),
                                 child: Container(
                                   alignment: Alignment.center,
                                   height: 24,
                                   width: 130,
                                   decoration: ShapeDecoration(
                                     color: Color(0xFFFD5356),
                                     shape: RoundedRectangleBorder(
                                       side: BorderSide(width: 1, color: Color(0xFFFD5356)),
                                       borderRadius: BorderRadius.circular(6),
                                     ),
                                   ),child: Text(
                                   '${response['status']}',
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 10,
                                     fontFamily: 'Product Sans',
                                     fontWeight: FontWeight.w400,
                                     height: 0,
                                     letterSpacing: 0.10,
                                   ),
                                 ),),
                               ),
                               SizedBox(height: 10.h,),
                               Text(
                                 'Price',
                                 style: TextStyle(
                                   color: Color(0xFFC2C2C2),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                               SizedBox(height: 5.h,),
                               Text(
                                 '\$ ${response['price']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 16,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.16,
                                 ),
                               ),
                               SizedBox(height: 5.h,),
                               Container(
                                 height: 24,
                                 padding: const EdgeInsets.symmetric(horizontal: 7.33, vertical: 4),
                                 decoration: ShapeDecoration(
                                   color: Color(0xFF0DB0F4),
                                   shape: RoundedRectangleBorder(
                                     side: BorderSide(width: 0.67, color: Color(0xFF0DB0F4)),
                                     borderRadius: BorderRadius.circular(4),
                                   ),
                                 ),
                                 child: Row(
                                   mainAxisSize: MainAxisSize.min,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Text(
                                       '${response['payment_method']}',
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 10,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.10,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               SizedBox(height: 20.h,),
                               Text(
                                 'VIN',
                                 style: TextStyle(
                                   color: Color(0xFFC2C2C2),
                                   fontSize: 12,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.12,
                                 ),
                               ),
                               Text(
                                 '${response['vin_number']}',
                                 style: TextStyle(
                                   color: Color(0xFF5D5D5D),
                                   fontSize: 16,
                                   fontFamily: 'Product Sans',
                                   fontWeight: FontWeight.w400,
                                   height: 0,
                                   letterSpacing: 0.16,
                                 ),
                               ),
                               SizedBox(height: 10.h,),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Registration Date:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['registration_date']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Registration Number:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['registration_number']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Registration State:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['registration_state']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Engine Size:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['engine_size']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Engine Number:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['engine_number']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Transmission:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['transmission']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Body Type:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['body_type']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Variant & Series:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['variant']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Built:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['built']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   SizedBox(height: 20.h,),
                                   Text(
                                     'Odometer:',
                                     style: TextStyle(
                                       color: Color(0xFFC2C2C2),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 8.0.sp),
                                     child: Text(
                                       '${response['odometer']}',
                                       style: TextStyle(
                                         color: Color(0xFF5D5D5D),
                                         fontSize: 12,
                                         fontFamily: 'Product Sans',
                                         fontWeight: FontWeight.w400,
                                         height: 0,
                                         letterSpacing: 0.12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 20.h,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Make',
                                         style: TextStyle(
                                           color: Color(0xFFC6C6C6),
                                           fontSize: 12,
                                           fontFamily: 'Product Sans',
                                           fontWeight: FontWeight.w400,
                                           height: 0,
                                           letterSpacing: 0.12,
                                         ),
                                       ),
                                       Container(
                                         height: 42,
                                         clipBehavior: Clip.antiAlias,
                                         decoration: ShapeDecoration(
                                           color: Color(0xFFF9F9F9),
                                           shape: RoundedRectangleBorder(
                                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                         ),
                                         child: Row(
                                           mainAxisSize: MainAxisSize.min,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 5.0,right: 5),
                                               child: Text(
                                                 '${response['brand']['name']}',
                                                 style: TextStyle(
                                                   color: Color(0xFF5D5D5D),
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
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Model',
                                         style: TextStyle(
                                           color: Color(0xFFC6C6C6),
                                           fontSize: 12,
                                           fontFamily: 'Product Sans',
                                           fontWeight: FontWeight.w400,
                                           height: 0,
                                           letterSpacing: 0.12,
                                         ),
                                       ),
                                       Container(
                                         alignment: Alignment.center,
                                         height: 42,
                                         clipBehavior: Clip.antiAlias,
                                         decoration: ShapeDecoration(
                                           color: Color(0xFFF9F9F9),
                                           shape: RoundedRectangleBorder(
                                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                         ),
                                         child: Row(
                                           mainAxisSize: MainAxisSize.min,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 5.0,right: 5),                                               child: Text(
                                                 '${response['model']['name']}',
                                                 style: TextStyle(
                                                   color: Color(0xFF5D5D5D),
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
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Variant',
                                         style: TextStyle(
                                           color: Color(0xFFC6C6C6),
                                           fontSize: 12,
                                           fontFamily: 'Product Sans',
                                           fontWeight: FontWeight.w400,
                                           height: 0,
                                           letterSpacing: 0.12,
                                         ),
                                       ),
                                       Container(
                                         width: 88,
                                         height: 42,
                                         clipBehavior: Clip.antiAlias,
                                         decoration: ShapeDecoration(
                                           color: Color(0xFFF9F9F9),
                                           shape: RoundedRectangleBorder(
                                             side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                         ),
                                         child: Row(
                                           mainAxisSize: MainAxisSize.min,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 5.0,right: 5),                                               child: Text(
                                                 'Hyundai',
                                                 style: TextStyle(
                                                   color: Color(0xFF5D5D5D),
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


                                 ],
                               ),
                               SizedBox(
                                 height: 20.h,
                               ),
                             ],
                           ),
                         )

                       ],
                     ),
                   ),
                   SizedBox(height: 20.h,),
                   Text(
                     'Car Condition',
                     style: TextStyle(
                       color: Color(0xFFC6C6C6),
                       fontSize: 10,
                       fontFamily: 'Product Sans',
                       fontWeight: FontWeight.w400,
                       height: 0,
                       letterSpacing: 0.10,
                     ),
                   ),
                   SizedBox(height: 2.h,),
                   Column(children: [
                     Container(
                       width: 320.w,
                       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 19),
                       clipBehavior: Clip.antiAlias,
                       decoration: ShapeDecoration(
                         color: Colors.white,
                         shape: RoundedRectangleBorder(
                           side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                           borderRadius: BorderRadius.circular(8),
                         ),
                       ),
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             width: 273,
                             height: 15,
                             child: Stack(
                               children: [
                                 Positioned(
                                   left: 0,
                                   top: 0,
                                   child: Text(
                                     'Is this Car Drivable?',
                                     style: TextStyle(
                                       color: Color(0xFF5D5D5D),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 239,
                                   top: 2,
                                   child: Container(
                                     width: 34,
                                     height: 12,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                         const SizedBox(width: 6),
                                         Text(
                                           '${response['vehicle_condition']['drivable']}',
                                           style: TextStyle(
                                             color: Color(0xFF5D5D5D),
                                             fontSize: 10,
                                             fontFamily: 'Product Sans',
                                             fontWeight: FontWeight.w400,
                                             height: 0,
                                             letterSpacing: 0.10,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 199,
                                   top: 2,
                                   child: Container(
                                     width: 31,
                                     height: 12,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [


                                         const SizedBox(width: 6),

                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           const SizedBox(height: 8),
                           Container(
                             width: 273,
                             height: 15,
                             child: Stack(
                               children: [
                                 Positioned(
                                   left: 0,
                                   top: 0,
                                   child: Text(
                                     'Is the Car Accidental?',
                                     style: TextStyle(
                                       color: Color(0xFF5D5D5D),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 239,
                                   top: 2,
                                   child: Container(
                                     width: 34,
                                     height: 12,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                         const SizedBox(width: 6),
                                         Text(
                                           '${response['vehicle_condition']['accidental']}',
                                           style: TextStyle(
                                             color: Color(0xFF5D5D5D),
                                             fontSize: 10,
                                             fontFamily: 'Product Sans',
                                             fontWeight: FontWeight.w400,
                                             height: 0,
                                             letterSpacing: 0.10,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 199,
                                   top: 2,
                                   child: Container(
                                     width: 31,
                                     height: 12,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                         const SizedBox(width: 6),

                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           const SizedBox(height: 8),
                           Container(
                             width: 273,
                             height: 15,
                             child: Stack(
                               children: [
                                 Positioned(
                                   left: 0,
                                   top: 0,
                                   child: Text(
                                     'Is the Car on WOVI?',
                                     style: TextStyle(
                                       color: Color(0xFF5D5D5D),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 239,
                                   top: 2,
                                   child: Container(
                                     width: 34,
                                     height: 12,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                         const SizedBox(width: 6),
                                         Text(
                                           '${response['vehicle_condition']['wovi']}',
                                           style: TextStyle(
                                             color: Color(0xFF5D5D5D),
                                             fontSize: 10,
                                             fontFamily: 'Product Sans',
                                             fontWeight: FontWeight.w400,
                                             height: 0,
                                             letterSpacing: 0.10,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 199,
                                   top: 2,
                                   child: Container(
                                     width: 31,
                                     height: 12,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                         const SizedBox(width: 6),

                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           const SizedBox(height: 8),
                           Container(
                             width: 273,
                             height: 15,
                             child: Stack(
                               children: [
                                 Positioned(
                                   left: 0,
                                   top: 0,
                                   child: Text(
                                     'Is the Car Under Finance?',
                                     style: TextStyle(
                                       color: Color(0xFF5D5D5D),
                                       fontSize: 12,
                                       fontFamily: 'Product Sans',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                       letterSpacing: 0.12,
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 239,
                                   top: 2,
                                   child: Container(
                                     width: 34,
                                     height: 12,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                         const SizedBox(width: 6),
                                         Text(
                                           '${response['vehicle_condition']['under_finance']}',
                                           style: TextStyle(
                                             color: Color(0xFF5D5D5D),
                                             fontSize: 10,
                                             fontFamily: 'Product Sans',
                                             fontWeight: FontWeight.w400,
                                             height: 0,
                                             letterSpacing: 0.10,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Positioned(
                                   left: 199,
                                   top: 2,
                                   child: Container(
                                     width: 31,
                                     height: 12,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [

                                         const SizedBox(width: 6),

                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(height: 30.h,),
                           Text(
                             'Owner Signature',
                             style: TextStyle(
                               color: Color(0xFFC6C6C6),
                               fontSize: 10,
                               fontFamily: 'Product Sans',
                               fontWeight: FontWeight.w400,
                               height: 0,
                               letterSpacing: 0.10,
                             ),
                           ),
                           SizedBox(height: 2.h,),

                           Container(
                             height: 80.h,

                             clipBehavior: Clip.antiAlias,
                             decoration: ShapeDecoration(
                               color: Colors.white,
                               shape: RoundedRectangleBorder(
                                 side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                                 borderRadius: BorderRadius.circular(8),
                               ),
                             ),
                             child: Image.network('${response['owner_signature_url']}')
                           ),
                         ],
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(height: 30.h,),
                           Text(
                             'Buyer Signature',
                             style: TextStyle(
                               color: Color(0xFFC6C6C6),
                               fontSize: 10,
                               fontFamily: 'Product Sans',
                               fontWeight: FontWeight.w400,
                               height: 0,
                               letterSpacing: 0.10,
                             ),
                           ),
                           SizedBox(height: 2.h,),
                           Container(
                             height: 80.h,

                             clipBehavior: Clip.antiAlias,
                             decoration: ShapeDecoration(
                               color: Colors.white,
                               shape: RoundedRectangleBorder(
                                 side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                                 borderRadius: BorderRadius.circular(8),
                               ),
                             ),
                             child: Image.network('${response['buyer_signature_url']}',
                             fit: BoxFit.cover,)
                           ),
                         ],
                       ),
                     ],
                   ),
                   SizedBox(
                     height: 30.h,
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
