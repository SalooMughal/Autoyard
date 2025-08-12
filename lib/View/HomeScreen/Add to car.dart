import 'dart:developer';

import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/View/HomeScreen/view_Car_Details.dart';
import 'package:autoyard/Widgets/Widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../CommonController/CommonController.dart';
import 'Additional_Informtation.dart';
import 'Car_Details.dart';
import 'Customer_Details.dart';
import 'Saved_Successfully.dart';

class Add_to_Car extends StatefulWidget {

  const Add_to_Car({super.key});

  @override
  State<Add_to_Car> createState() => _Add_to_CarState();
}

class _Add_to_CarState extends State<Add_to_Car> {
  @override
  CommonContoller commonContoller = Get.find<CommonContoller>();
  String _selectedStateAbbreviation='';
  final TextEditingController _textController = TextEditingController();
  RxBool isloading=false.obs;

// Holds selected state abbreviation
  Map<String, String> states = {
    "ACT": "Australian Capital Territory",
    "NSW": "New South Wales",
    "NT": "Northern Territory",
    "QLD": "Queensland",
    "SA": "South Australia",
    "TAS": "Tasmania",
    "VIC": "Victoria",
    "WA": "Western Australia"
  };
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Registration Number',
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
              'Registration Number',
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
          width: 320.w, // Adjust to fit your layout
          height: 50.h, // Adjust for responsive sizing
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            children: [
              // Display selected state abbreviation if any
              if (_selectedStateAbbreviation != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                ),
              // Expanding the TextFormField to take available space
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'REGCHK',
                    ),
                  ),
                ),
              ),
              // Decrease width for the dropdown button container
              DropdownButton<String>(
                padding:  EdgeInsets.zero,


                hint: Padding(
                  padding:  EdgeInsets.only(left: 120.0.sp),
                  child: Text('States'),
                ),
                dropdownColor: Colors.white,
                icon: Icon(Icons.arrow_drop_down),
                underline: SizedBox(), // Removes underline
                items: states.keys.map((String abbreviation) {
                  return DropdownMenuItem<String>(
                    value: abbreviation,
                    child: Text(states[abbreviation]!),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedStateAbbreviation = newValue!;
                  });
                },
              ),
            ],
          ),
        ),


        SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: (){
                commonContoller.Clear_Add_A_Car_Details();


                Get.to(Car_Details(origin: 'Manual',));
              },
              child: Container(
                alignment: Alignment.center,
                child:  Text(
                  'Insert Car Manually',
                  style: TextStyle(
                    color: Color(0xFF0DB0F4),
                    fontSize: 14,
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.14,
                  ),
                ),
                width: 320.w,
                height: 44.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50, color: Color(0xFF0DB0F4)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[ Obx(()=>
                   isloading.value?CircularProgressIndicator():GestureDetector
                    (
                    onTap: ()async{
                      isloading.value=true;
                     await  Api_Interface().Get_Registration_by_no(_textController.text.toString(),_selectedStateAbbreviation!);
                      isloading.value=false;

                    },
                      child: Application_Button('Submit')),
                )])
          ],
        ),
      ),
    );
  }
}
