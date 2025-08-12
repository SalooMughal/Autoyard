import 'dart:developer';

import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/CommonController/CommonController.dart';
import 'package:autoyard/Models/Car_Brand_Model.dart';
import 'package:autoyard/Widgets/Widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'Customer_Details.dart';

class Car_Details extends StatefulWidget {
  String origin='';
   Car_Details({super.key, required this.origin});

  @override
  State<Car_Details> createState() => _Car_DetailsState();
}

class _Car_DetailsState extends State<Car_Details> {
  CommonContoller commonContoller=Get.find<CommonContoller>();
  RxBool isAutoSelected = true.obs;
  @override
  void initState() {
    if(widget.origin=='Automatic'){
      if(commonContoller.selected_transmission.value=='Auto'){
        isAutoSelected.value=true;
      }else{
        isAutoSelected.value=false;
    }
    }else if(widget.origin=='Manual'){
      commonContoller.selected_transmission.value='Auto';

    }
    commonContoller.carVariantlList.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
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
                'Car Details',
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
                        'Make',
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

                      FutureBuilder(
                        future: Api_Interface().Get_Car_Brand(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final response = snapshot.data as List<dynamic>;
                            if(widget.origin=='Manual'){
                              commonContoller.selectedCarMake.value='';

                            }
                            // Convert List<dynamic> to List<Map<String, dynamic>>
                            List<Map<String, dynamic>> brands = response.map((item) => item as Map<String, dynamic>).toList();

                            // Extract brand names and IDs
                            List<CarBrand> carBrands = brands.map((brand) => CarBrand(
                              id: brand['id'],
                              name: brand['name'],
                            )).toList();

                            // Create a default CarBrand object
                            CarBrand? defaultCarBrand;

                            // Find the selected car make or use the default CarBrand
                            CarBrand? selectedCarBrand = carBrands.firstWhere(
                                  (carBrand) => carBrand.name == commonContoller.selectedCarMake.value,
                              orElse: () {
                                defaultCarBrand = CarBrand(id: -1, name: 'Select Make');
                                return defaultCarBrand!;
                              },
                            );

                            return Container(
                              width: 320.w,
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(left: 8.0.sp,bottom: 10.sp),
                                child: DropdownButtonFormField<CarBrand>(
                                  dropdownColor: Colors.white,
                                  value: selectedCarBrand?.id == -1 ? null : selectedCarBrand,
                                  items: carBrands.map((CarBrand brand) {
                                    return DropdownMenuItem<CarBrand>(
                                      value: brand,
                                      child: Text(
                                        brand.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (CarBrand? newValue) async {
                                    if (newValue != null) {
                                      commonContoller.selectedCarMake.value = newValue.name;
                                      // Get the selected brand ID
                                      int selectedBrandId = newValue.id;
                                      commonContoller.Selected_Car_Make_id.value=newValue.id;
                                      // Use the ID as needed
                                      print('Selected Brand ID: $selectedBrandId');
                                      commonContoller.carVariantlList.clear();

                                      await Api_Interface().Get_Car_Model(selectedBrandId.toString());
                                    }
                                  },
                                  decoration: InputDecoration(

                                    border: InputBorder.none,
                                    hintText: '${commonContoller.selectedCarMake.value.isEmpty?'Model':commonContoller.selectedCarMake.value}',
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20.h,),
              Obx(()=>
                 commonContoller.carVariantlList.isNotEmpty||widget.origin=='Automatic'?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Model',
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
                      alignment: Alignment.center,
                      width: 320.w,

                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding:   EdgeInsets.only(left: 8.0.sp,bottom: 10.sp),

                        child: Obx(() {

                          List<String> variantList = commonContoller.carVariantlList.toSet().toList();
                          print(variantList);
                          String? selectedValue = commonContoller.selectedCarModel.value;

                          return DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            value: variantList.contains(selectedValue) ? selectedValue : null,
                            items: variantList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                commonContoller.selectedCarModel.value = newValue;

                                // Find the ID and name from the list
                                int selectedItemId = 0;
                                String selectedItemName = '';

                                for (var item in commonContoller.carVariant_id_List) {
                                  if (item.name == newValue) {
                                    commonContoller.Selected_Car_Model_id.value = item.id;
                                    selectedItemName = item.name;
                                    break; // Exit the loop once a match is found
                                  }
                                }

                                print(commonContoller.Selected_Car_Model_id.value);
                                print(selectedItemName);
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '${commonContoller.selectedCarModel.isEmpty?'Model':commonContoller.selectedCarModel}',
                            ),
                          );
                        }),
                      ),
                    )


                  ],
                ):Text(''),
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
                        'Rego',
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
                              controller: commonContoller.Car_RegistrationNo_Controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '0000'
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
                        'Rego Date',
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
                          commonContoller.Car_RegistrationDue_Controller.value = DateFormat('yyyy-MM-dd').format(datePicked!);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child:Obx(()=> Text('${commonContoller.Car_RegistrationDue_Controller.isEmpty?'yyyy-dd-mm':commonContoller.Car_RegistrationDue_Controller}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                              ),))
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
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Variant & Series',
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
                      controller: commonContoller.Car_Variant_Series_Controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Variant & Series'
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Built',
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
                          commonContoller.Car_Built_Controller.value = DateFormat('yyyy-MM-dd').format(datePicked!);

                        },
                        child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 100.w,
                                    height: 42.h,
                                child: Obx(()=>
                                  Text('${commonContoller.Car_Built_Controller.value.isEmpty?'yyyy-dd-mm':commonContoller.Car_Built_Controller}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15
                                    ),),
                                )),
                                  Text(
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
                                ],
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
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Engine Size',
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
                                Container(
                                  width: 100.w,
                                  height: 42.h,
                                  child: TextFormField(
                                    controller: commonContoller.Car_Engine_Size_Controller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '4 Cylinder'
                                    ),
                                  ),
                                ),
                                Text(
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
                              ],
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
                'VIN',
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
                      controller: commonContoller.Car_Vin_Controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ZXCVBNJHUYTR45123'
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
                'Engine Number',
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
                      controller: commonContoller.Car_Engine_Controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '2346975452315'
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Odometer',
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
                              controller: commonContoller.Car_Odameter_Controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '099999'
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
                        'Body Type',
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
                              controller: commonContoller.Car_Body_type_Controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Sedan'
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
                'Transmission',
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
          Obx(()=>
             Container(
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
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        commonContoller.selected_transmission.value='Auto';
                        log( commonContoller.selected_transmission.value);
                        isAutoSelected .value= true;

                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            isAutoSelected.value
                                ? 'assets/icons/Check.svg'
                                : 'assets/icons/uncheck.svg',
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.0.sp),
                            child: Text(
                              'Auto',
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
                    GestureDetector(
                      onTap: () {
                        commonContoller.selected_transmission.value='Manual';
                        isAutoSelected.value = false;

                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            !isAutoSelected.value
                                ? 'assets/icons/Check.svg'
                                : 'assets/icons/uncheck.svg',
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.0.sp),
                            child: Text(
                              'Manual',
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
              ),
            ),
          ),
              SizedBox(
                height: 40.h,
              ),
          GestureDetector(
            onTap: (){

              if(commonContoller.Selected_Car_Make_id.value==null){
                Get.snackbar('', 'Make is missing');
              }else if(commonContoller.Selected_Car_Model_id.value==null){
                Get.snackbar('', 'Model is missing');
              }else if(commonContoller.Car_RegistrationNo_Controller.text.isEmpty){
                Get.snackbar('', 'Registration No is missing');
              }else if(commonContoller.Car_Variant_Series_Controller.text.isEmpty){
                Get.snackbar('', 'Variant & Series No is missing');
              }else if(commonContoller.Car_Built_Controller.value.isEmpty){
                Get.snackbar('', 'Built is missing');
              }else if(commonContoller.Car_Engine_Size_Controller.text.isEmpty){
                Get.snackbar('', 'Engine Size is missing');
              }else if(commonContoller.Car_Vin_Controller.text.isEmpty){
                Get.snackbar('', 'Vin no is missing');
              }else if(commonContoller.Car_Vin_Controller.text.length<17){
                Get.snackbar('', 'Vin no must be greater then 17 digits');
              }
              else if(commonContoller.Car_Engine_Controller.text.isEmpty){
                Get.snackbar('', 'Engine no is missing');
              }else if(commonContoller.Car_Odameter_Controller.value.text.isEmpty){
                Get.snackbar('', 'Odameter is missing');
              }else if(commonContoller.Car_Body_type_Controller.text.isEmpty){
                Get.snackbar('', 'Body type is missing');
              }else if(commonContoller.selected_transmission.isEmpty){
                Get.snackbar('', 'Transmission is missing');
              }
              else{
                Get.to(Customer_Details());

              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
              ],
            ),
          ),
              SizedBox(
                height: 90.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
