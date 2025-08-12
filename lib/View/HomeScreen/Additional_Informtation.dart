import 'dart:developer';

import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/CommonController/CommonController.dart';
import 'package:autoyard/View/HomeScreen/Buyer_Signature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

import 'Saved_Successfully.dart';
import 'Seller_Signature.dart';

class Additional_Information extends StatefulWidget {
  const Additional_Information({super.key});

  @override
  State<Additional_Information> createState() => _Additional_InformationState();
}

class _Additional_InformationState extends State<Additional_Information> {
  int selectedOption = -1;
  CommonContoller commonContoller=Get.find<CommonContoller>();
  bool isBankTransferSelected = true;
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  RxBool terms_condition=false.obs;
  RxBool isloading=false.obs;
  @override
  void initState() {
    commonContoller.Payment_Method.value='Bank Transfer';
    super.initState();
  }
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
          padding:  EdgeInsets.only(left: 20.0,right: 20,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Additional Information',
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
              SizedBox(
                height: 5.h,
              ),
          Container(
            width: 357.w,

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

                buildOptionRow(
                  'Is this Car Drivable?',
                  0,
                ),
                buildOptionRow(
                  'Is this Car Accidental?',
                  1,
                ),
                buildOptionRow(
                  'Is this Car on WOVI?',
                  2,
                ),
                buildOptionRow(
                  'The car is under finance?',
                  3,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
              SizedBox(
                height: 20.h,
              ),
        
              Text(
                'Add a Note',
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
                          alignment: Alignment.center,
                          width: 250.w,
                          height: 42.h,
                          child: TextFormField(
                            controller: commonContoller.Add_Note_Controller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Write your comments here'
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
                  height: 50.h,
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
                'Purchase Price',
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
              Container(alignment: Alignment.center,
                child: Padding(
                  padding:  EdgeInsets.only(left: 8.0,top: 8.sp),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: commonContoller.Purchase_Price_Controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add here',
                      prefixIcon: Padding(
                        padding:  EdgeInsets.only(left: 15.0, right: 8.0,bottom: 8.sp),
                        child: SvgPicture.asset(
                          'assets/icons/dollar.svg', // Path to your SVG file
                          height: 0.h,
                          width: 0.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                width: 357.w,
                height: 50.h,
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
              Text(
                'Payment Method',
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
              padding: const EdgeInsets.only(left: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 15.0.sp),
                    child: GestureDetector(
                      onTap: () {
                        commonContoller.Payment_Method.value='Bank Transfer';

                        setState(() {
                          isBankTransferSelected = true; // Select Bank Transfer
                        });
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            isBankTransferSelected
                                ? 'assets/icons/Check.svg' // Show checked icon if selected
                                : 'assets/icons/uncheck.svg',
                            height: 15.h,
                            width: 15.w,// Show unchecked icon if not selected
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0.sp),
                            child: Text(
                              'Bank Transfer',
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
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 15.0.sp),
                    child: GestureDetector(
                      onTap: () {
                        commonContoller.Payment_Method.value='Cash';
                        setState(() {

                          isBankTransferSelected = false; // Select Cash
                        });
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            isBankTransferSelected
                                ? 'assets/icons/uncheck.svg' // Show unchecked icon if Bank Transfer is selected
                                : 'assets/icons/Check.svg',
                            height: 15.h,
                            width: 15.w,// Show checked icon if Cash is selected
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.0.sp),
                            child: Text(
                              'Cash',
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
              InkWell(
                onTap: (){
                  Get.to(Seller_Signature());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Seller/Owner Signature',
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
                          width: 155.w,
                          height: 40.h,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 11, left: 8, right: 7, bottom: 11),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 2.0.sp),
                                child: Text(
                                  'Add Signature',
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
                              const SizedBox(width: 13),
                              InkWell(
                                onTap: (){
                                  Get.to(Seller_Signature());

                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 50.w,
                                  height: 20.h,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF0DB0F4),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 28,
                                        height: 17,
                                        child: Text(
                                          'Draw',
                                          style: TextStyle(
                                            color: Colors.white,
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: 155.w,
                          height: 40.h,
                          padding: const EdgeInsets.only(top: 11, left: 8, right: 7, bottom: 11),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 2.0.sp),
                                child: Text(
                                  'Add Signature',
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
                              const SizedBox(width: 13),
                              InkWell(
                                onTap: (){
                                  Get.to(Buyer_Signature());

                                },
                                child: Container(
                                  width: 50.w,
                                  height: 20.h,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF0DB0F4),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 28,
                                        height: 17,
                                        child: Text(
                                          'Draw',
                                          style: TextStyle(
                                            color: Colors.white,
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
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Obx(()=>
                     GestureDetector(
                      onTap: (){
                        if(terms_condition==false){
                          commonContoller.terms_condition.value=true;
                          terms_condition.value=true;
                        }else{
                          terms_condition.value=false;
                          commonContoller.terms_condition.value=false;
                        }

                      },
                      child:terms_condition.value? SvgPicture.asset('assets/icons/Check.svg',

                      height: 20,
                      width: 20,):SvgPicture.asset('assets/icons/Check.svg',
                        color: Colors.grey.shade200,
                        height: 20,
                        width: 20,),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 280,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'By continuing you’re agree with our ',
                            style: TextStyle(
                              color: Color(0xFF5D5D5D),
                              fontSize: 12,
                              fontFamily: 'Product Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.12,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms & Condition',
                            style: TextStyle(
                              color: Color(0xFF0DB0F4),
                              fontSize: 12,
                              fontFamily: 'Product Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(()=>
                 isloading.value?Center(child: CircularProgressIndicator()):InkWell(
                   onTap: ()async{


                      if(commonContoller.Add_Note_Controller.text.isEmpty){
                       Get.snackbar('', 'Note is missing');
                     }else if(commonContoller.Purchase_Price_Controller.text.isEmpty){
                       Get.snackbar('', 'Purchase Price is missing');
                     }else if(commonContoller.Payment_Method.isEmpty){
                       Get.snackbar('', 'Payment method is missing');

                     }
                     else if(commonContoller.Seller_Signature_Image.value!.isEmpty){
                       Get.snackbar('', 'Seller Signature is missing');
                     }
                     else if(commonContoller.Buyer_Signature_Image.value!.isEmpty){
                       Get.snackbar('', 'Buyer Signature is missing');
                     }
                     else if(commonContoller.Buyer_Signature_Image.value!.isEmpty){
                       Get.snackbar('', 'Buyer Signature is missing');
                     }else if(terms_condition.value==false){
                       Get.snackbar('', 'Please Agree terms and condition');
                     }else{
                       isloading.value=true;
                       Map<String , dynamic> vechile_condtition={
                         'drivable':'${commonContoller.Car_Driverable}',
                         'accidental':'${commonContoller.Car_Accidental}',
                         'wovi':'${commonContoller.Car_Wovi}',
                         'under_finance':'${commonContoller.Car_Finance}'
                       };
                       await Api_Interface().Add_a_car(vechile_condtition);
                       isloading.value=false;


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
                             'Submit Data',
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
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Map<int, String> selectedOptions = {};

  Widget buildOptionRow(String title, int index) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0.sp, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title Text
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontSize: 14,
              fontFamily: 'Product Sans',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: 0.12,
            ),
          ),
          // Yes/No buttons (Tick and Cross)
          Row(
            children: [
              // Tick Button for "Yes"
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Mark this index as "Yes"
                    selectedOptions[index] = 'Yes';
                    if(title=='Is this Car Drivable?'){
                      commonContoller.Car_Driverable.value='Yes';
                    }else if(title=='Is this Car Accidental?'){
                      commonContoller.Car_Accidental.value='Yes';
                    }else if(title=='Is this Car on WOVI?'){
                      commonContoller.Car_Wovi.value='Yes';
                    }else if(title=='The car is under finance?'){
                      commonContoller.Car_Finance.value='Yes';
                    }
                  });
                },
                child: selectedOptions[index] == 'Yes' ?SvgPicture.asset(
                  'assets/icons/Check.svg',
                  height: 15.h,
                  width: 15.w,

                ):SvgPicture.asset(
                    'assets/icons/uncheck_tick.svg',
                    height: 15.h,
                    width: 15.w,
              )),
              SizedBox(width: 10), // Space between Tick and Cross
              // Cross Button for "No"
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Mark this index as "No"
                    selectedOptions[index] = 'No';
                    if(title=='Is this Car Drivable?'){

                      commonContoller.Car_Driverable.value='No';
                      print('Is this Car Drivable?');
                    }else if(title=='Is this Car Accidental?'){

                      commonContoller.Car_Accidental.value='No';
                      print('Is this Car Accidental?');
                    }else if(title=='Is this Car on WOVI?'){

                      commonContoller.Car_Wovi.value='No';
                      print('Is this Car on WOVI?');
                    }else if(title=='The car is under finance?'){

                      commonContoller.Car_Finance.value='No';
                      print('The car is under finance?');
                    }
                  });
                },
                child: SvgPicture.asset(
                  'assets/icons/Cross_Button.svg',
                  height: 15.h,
                  width: 15.w,
                  color: selectedOptions[index] == 'No' ? Colors.red : Colors.grey, // Highlight if "No" selected
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
