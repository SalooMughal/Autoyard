import 'dart:developer';
import 'dart:io';

import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../CommonController/CommonController.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  CommonContoller commonContoller=Get.find<CommonContoller>();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController phonename=TextEditingController();
  RxBool isloading=false.obs;
  @override
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        log(image.path);
      });
      // Now you can upload the image to your server or do anything you want with it.
    }
  }
  void initState() {
   firstname.text=commonContoller.user_First_name.value;
   lastname.text=commonContoller.user_Last_name.value;
   phonename.text=commonContoller.user_Phone_No.value;
    super.initState();

  }
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
          GestureDetector(onTap: ()async{
            isloading.value=true;
            if(_image==null){
              Get.snackbar('Error', 'Please select the image!');
            }else{
              await Api_Interface().Profile_Edit(firstname.text, lastname.text, phonename.text,_image!);

            }
            isloading.value=false;
          },
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Obx(()=>
                 isloading.value?CircularProgressIndicator():Text(
                  'Done',
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
          ),
        ],
        title: Column(
          children: [

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  SvgPicture.asset('assets/images/profile (3).svg'),
                  SizedBox(height: 20.h,),
                  Text(
                    '${firstname.text}',
                    style: TextStyle(
                      color: Color(0xFF004968),
                      fontSize: 16,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.16,
                    ),
                  ),
                  Text(
                    'Autoyard Driver',
                    style: TextStyle(
                      color: Color(0xFF004968),
                      fontSize: 12,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.12,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                ]),


            //   Container(
            //   width: 310.w,
            //   height: 95.h,
            //   decoration: ShapeDecoration(
            //     color: Color(0xFFF7F7F7),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('               '),
            //
            //       // GestureDetector(
            //       //   onTap: _pickImage, // Tap to select an image
            //       //   child: Container(
            //       //     alignment: Alignment.center,
            //       //     width: 75.w,
            //       //     height: 67.h,
            //       //     decoration: ShapeDecoration(
            //       //       color:_image == null? Color(0xFFBEECFF):null,
            //       //       shape: RoundedRectangleBorder(
            //       //         borderRadius: BorderRadius.circular(50),
            //       //       ),
            //       //     ),
            //       //     child: _image == null
            //       //         ? SvgPicture.asset('assets/icons/Camera.svg')
            //       //         : ClipRRect(
            //       //       borderRadius: BorderRadius.circular(60),
            //       //           child: Image.file(
            //       //             _image!,
            //       //             width: 75.w,
            //       //             height: 67.h,
            //       //             fit: BoxFit.fill,
            //       //           ),
            //       //         )
            //       //   ),
            //       // ),
            //       Padding(
            //         padding: const EdgeInsets.only(bottom: 50.0, right: 20),
            //         child: Text(
            //           'Upload Photo',
            //           style: TextStyle(
            //             color: Color(0xFF004968),
            //             fontSize: 13,
            //             fontFamily: 'Product Sans',
            //             fontWeight: FontWeight.w400,
            //             height: 0,
            //             letterSpacing: 0.10,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0 ,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General Information',
                    style: TextStyle(
                      color: Color(0xFF004968),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 0.14,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 330.w,
                    height: 56.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                       Padding(
                         padding:  EdgeInsets.only(left: 8.0,top: 8.0.sp),
                         child: TextFormField(
                           controller: firstname,
                           decoration: InputDecoration(
                             hintText: '${commonContoller.user_First_name.value}',
                             labelText: 'First Name',
                               hintStyle: TextStyle(
                                 color: Color(0xFF004968),
                                 fontSize: 14,
                                 fontFamily: 'Product Sans',
                                 fontWeight: FontWeight.w400,
                                 height: 0,
                                 letterSpacing: 0.14,
                               ),
                             border: InputBorder.none
                           ),
                         ),
                       )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 330.w,
                    height: 56.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 8.0,top: 8.0.sp),
                          child: TextFormField(
                            controller: lastname,
                            decoration: InputDecoration(
                                hintText:'${commonContoller.user_Last_name.value}',
                                labelText: 'Last Name',
                                hintStyle: TextStyle(
                                  color: Color(0xFF004968),
                                  fontSize: 14,
                                  fontFamily: 'Product Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.14,
                                ),
                                labelStyle: TextStyle(
                                  color: Color(0xFF004968),
                                ),
                                border: InputBorder.none
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      color: Color(0xFF004968),
                      fontSize: 14,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.14,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 330.w,
                    height: 56.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 8.0,top: 8.0.sp),
                          child: TextFormField(
                            controller: phonename,
                            decoration: InputDecoration(
                                hintText:'${commonContoller.user_Phone_No.value}',
                                hintStyle: TextStyle(
                                  color: Color(0xFF004968),
                                  fontSize: 14,
                                  fontFamily: 'Product Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.14,
                                ),
                                labelStyle: TextStyle(
                                  color: Color(0xFF004968),
                                ),
                                labelText: 'Phone number',
                                border: InputBorder.none
                            ),
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
    );
  }
}
