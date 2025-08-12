import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../CommonController/CommonController.dart';
import 'Additional_Informtation.dart';
import 'dart:ui' as ui;

class Customer_Details extends StatefulWidget {
  const Customer_Details({super.key});

  @override
  State<Customer_Details> createState() => _Customer_DetailsState();
}

class _Customer_DetailsState extends State<Customer_Details> {
  CommonContoller commonContoller=Get.find<CommonContoller>();

  bool isSameAsPickup = false; // State to track the checkbox status
  bool isEditingAddress = false; // State to track if the address is being edited
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
              'Add A Car',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Customer Details',
                style: TextStyle(
                  color: Color(0xFF004968),
                  fontSize: 18,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 0.18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(
                          color: Color(0xFFC6C6C6),
                          fontSize: 10,
                          fontFamily: 'Product Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.10,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: commonContoller.First_Name_Controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'John'
                              ),
                            ),
                          ),
                          width: 157.w,
                          height: 42.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: TextStyle(
                          color: Color(0xFFC6C6C6),
                          fontSize: 10,
                          fontFamily: 'Product Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.10,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: commonContoller.Last_Name_Controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Michel'
                              ),
                            ),
                          ),
                          width: 157.w,
                          height: 42.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
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
              SizedBox(
                height: 5.h,
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 250.w,
                          height: 42.h,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: commonContoller.ABN_ACN_Controller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'N-NNN-NNN-NNN'
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            'Optional',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFC2C2C2),
                              fontSize: 10,
                              fontFamily: 'Product Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  width: 350.w,
                  height: 42.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),

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
              SizedBox(
                height: 5.h,
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: commonContoller.License_Controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'N-NNN-NNNN'
                      ),
                    ),
                  ),
                  width: 357.w,
                  height: 42.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),

              Text(
                'Buisness Name',
                style: TextStyle(
                  color: Color(0xFFC6C6C6),
                  fontSize: 10,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.10,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: commonContoller.Buisness_Controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buisness Name'
                      ),
                    ),
                  ),
                  width: 357.w,
                  height: 42.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),

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
              SizedBox(
                height: 5.h,
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: commonContoller.Phone_No_Controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone number'
                      ),
                    ),
                  ),
                  width: 357.w,
                  height: 42.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),

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
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: ()async{
                  var datePicked = await DatePicker.showSimpleDatePicker(
                    context,
                    // initialDate: DateTime(2020),
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2025),
                    dateFormat: "yyyy-MM-dd",
                    locale: DateTimePickerLocale.en_us,
                    looping: true,
                  );
                  commonContoller.Pickup_Date_Controller.value = DateFormat('yyyy-MM-dd').format(datePicked!);

                },
                child: Container(
                  alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                        child:Obx(()=> Text('${commonContoller.Pickup_Date_Controller.value.isEmpty?'yyyy-dd-mm':commonContoller.Pickup_Date_Controller.value}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),))
                    ),
                    width: 357.w,
                    height: 42.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),

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
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: ()async{
                  var datePicked = await DatePicker.showSimpleDatePicker(
                    context,
                    // initialDate: DateTime(2020),
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2025),
                    dateFormat: "yyyy-MM-dd",
                    locale: DateTimePickerLocale.en_us,
                    looping: true,
                  );
                  commonContoller.Date_of_birth_Controller.value = DateFormat('yyyy-MM-dd').format(datePicked!);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Obx(()=> Text('${commonContoller.Date_of_birth_Controller.value.isEmpty?'yyyy-dd-mm':commonContoller.Date_of_birth_Controller.value}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        ),))
                    ),

                    width: 357.w,
                    height: 42.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),

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
              SizedBox(
                height: 5.h,
              ),

              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: commonContoller.Pickup_Address_Controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add Pickup Address here'
                      ),
                    ),
                  ),
                  width: 357.w,
                  height: 42.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),
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
              SizedBox(
                height: 5.h,
              ),


              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      // Custom Checkbox (Check or Uncheck images)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSameAsPickup = !isSameAsPickup; // Toggle the checkbox state

                            if (isSameAsPickup) {
                              // When checked, copy pickup address to residential address
                              commonContoller.Pickup_residential_Address_Controller.text = commonContoller.Pickup_Address_Controller.text;
                            } else {
                              // When unchecked, keep the residential address as the text field value
                              commonContoller.Pickup_residential_Address_Controller.clear();
                            }
                          });

                          log('Residential Address: ${commonContoller.Pickup_residential_Address_Controller.text}');
                        },
                        child: isSameAsPickup
                            ? SvgPicture.asset('assets/icons/Check.svg', height: 15.h, width: 15.w) // Checked
                            : SvgPicture.asset('assets/icons/uncheck_tick.svg', height: 15.h, width: 15.w), // Unchecked
                      ),
                      SizedBox(width: 10), // Space between checkbox and text

                      // Address or TextFormField based on checkbox state
                      Expanded(
                        child: isSameAsPickup
                            ? Text(
                          'Same as Pickup Address',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                          ),
                        )
                            : isEditingAddress
                            ? TextFormField(
                          controller: commonContoller.Pickup_residential_Address_Controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add Residential Address here',
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        )
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current Address: Your Address',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isEditingAddress = true; // Enable editing mode
                                });
                              },
                              child: Text(
                                'Change Address',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                width: 357.w,
                height: 42.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),


              SizedBox(
                height: 20.h,
              ),

              GestureDetector(
                onTap: (){

                  // Get.to(Additional_Information());
                  if(commonContoller.First_Name_Controller.text.isEmpty){
                    Get.snackbar('', 'First name is missing');
                  }else if(commonContoller.Last_Name_Controller.text.isEmpty){
                    Get.snackbar('', 'Last name is missing');

                  }else if(commonContoller.ABN_ACN_Controller.text.isEmpty){
                    Get.snackbar('', 'ABN is missing');
                  }else if(commonContoller.License_Controller.text.isEmpty){
                    Get.snackbar('', 'License no is missing');
                  }else if(commonContoller.Buisness_Controller.text.isEmpty){
                    Get.snackbar('', 'Business no is missing');
                  }else if(commonContoller.Phone_No_Controller.text.isEmpty){
                    Get.snackbar('', 'Phone no is missing');
                  }else if(commonContoller.Pickup_Date_Controller.isEmpty){
                    Get.snackbar('', 'Pickup data is missing');
                  }else if(commonContoller.Date_of_birth_Controller.isEmpty){
                    Get.snackbar('', 'Date of birth is missing');

                  }
                  else if(commonContoller.Pickup_Address_Controller.text.isEmpty){
                    Get.snackbar('', 'Pickup address is missing');

                  } else if(commonContoller.Pickup_residential_Address_Controller.text.isEmpty){
                    Get.snackbar('', 'Residential address is missing');

                  }else{
                    Get.to(Additional_Information());
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/Arrow 2.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Next',
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
                    ],
                  ),
                  width: Get.width*0.87,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0DB0F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
