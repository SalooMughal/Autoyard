import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/View/HomeScreen/Add%20to%20Car.dart';
import 'package:autoyard/View/HomeScreen/HomeScreen.dart';
import 'package:autoyard/View/HomeScreen/view_Car_Details.dart';
import 'package:autoyard/Widgets/Home_Screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../CommonController/CommonController.dart';

class SavedSuccessfully extends StatefulWidget {
  const SavedSuccessfully({super.key});

  @override
  State<SavedSuccessfully> createState() => _SavedSuccessfullyState();
}

class _SavedSuccessfullyState extends State<SavedSuccessfully> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt currentindex=0.obs;
  RxBool isloading=false.obs;
  RxBool isloading2=false.obs;
  CommonContoller commonContoller=Get.find<CommonContoller>();

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{

        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar:AppBar(
          automaticallyImplyLeading: false,  // Hides the back button

          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Container(
              color: Color(0xFFC5C5C5), // Color of the line
              height: 1.0, // Height of the line
            ),
          ),
          title: Column(
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

        body: Column(
          children: [
            SizedBox(height: 100.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/successfully.svg')
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 234,
                  child: Text(
                    'Your Car Details has been Successfully Saved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF004968),
                      fontSize: 18,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 130.h,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(()=>
                     isloading2.value?CircularProgressIndicator():GestureDetector(
                      onTap:()async{
                        // print(commonContoller.Add_a_Car_id.value);
                        // commonContoller.bearertoken.value='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjkyNWYxNjk5MTQ4NTQ1Y2U5MzQ2Mjg3ZTVlMzNiYWVlY2FlYzFlOTlmZGMzZGJmMzBkZDZkZGIzYjZlYzVlYzliZmVlY2M4NWU0YjVjZGUiLCJpYXQiOjE3MjQ2NTUwODYuOTAxOTU5LCJuYmYiOjE3MjQ2NTUwODYuOTAxOTYyLCJleHAiOjE3NTYxOTEwODYuODk0NjQ5LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.LtBEo_DbQZsXaX5ASngskDh_aHPdZ5N9-xWOY69fI2i7De4YASwt6hlT-YqBdxqZdd4cJT5ZzvoYlwotL2gPyPtB0FwVahSvJ97GcFfcpWT39Ui8BC4q1SLRc_aVHbMjdYTDJPaTKYsm8ZH1VxnSvY2ME5EQhjHUjfP6e6cq4ejnBhdX-CLYwWLnFvWzXfp6bv81jih_i-TYJKeP5NK8LITEsillHUSi8rPkOyK-NwN55TWtBAEi88l-M9PAAckI_3216ciHsm6nOOMNl-dyyyuXhA1uW8BwdkzSsJt7snvgp9WyiYd3K3uip4V9yA6GOoaU-38bPYXH5N0lUOdWLWlIf2TJ5FonOe0WdMEGnSoZGCDvukLTZNeEeNky4b5ZN3eeAGtobPCTQeaeF7_pBTsa-2mBmBzBNSWVhyaz4hCod2BPQBSnjVgzmpjZYTmklNYUS6Y_PofiZ1WdHkUBMkf3WJ0RA3f0tIi69vuG68XT_8V7EOgktGiN3vF16hqkkCbw5g5jWRi2Daa4Zcp0PMUh1dVUh_19BaoOw6e1xo_krb9rHR8GtLUyGue7qr3QPW08I-0UvFs8Jpf0g6hX3L2H3MFzIh0cjw5gqQ7T-vP-OgP2BJvcEk2wtcgaKeokWu_mghx6mGr2Nmd3ufdjkrvFNTaImmsQBzv43xnLx3A';
                        isloading2.value=true;
                        await Api_Interface().Get_Purchase_recepit_pdf(context);
                        isloading2.value=false;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                                  'Get PDF',
                                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.12,
                                    ),
                                  ),
                        width: 97.w,
                        height: 42,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0DB0F4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.95, color: Color(0xFF0DB0F4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                    ),
                  ),

                    GestureDetector(
                      onTap: ()async{
                        _showPopup(context);


                      },
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Product Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.12,
                            ),
                          ),
                          width: 97.w,
                          height: 42,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFF0DB0F4),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.95, color: Color(0xFF0DB0F4)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                    ),

                  GestureDetector(
                    onTap: (){
                      Get.to(ViewCarDetails());
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'View Car Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Product Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.12,
                          ),
                        ),
                        width: 97.w,
                        height: 42,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0DB0F4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.95, color: Color(0xFF0DB0F4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                  ),
                ],
              ),
            ),
        SizedBox(height: 20.h,),
        GestureDetector(
          onTap: (){
            Get.to(HomeScreen());
          },
          child: Container(
            child: Text(
              'Close',
              style: TextStyle(
                color: Color(0xFF0DB0F4),
                fontSize: 16,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.16,
              ),
            ),


            alignment: Alignment.center,
            width: 333.w,
            height: 50.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.95, color: Color(0xFF0DB0F4)),
                borderRadius: BorderRadius.circular(200),
              ),
            )),
        ),
          ],
        ),
      ),
    );
  }
  void _showPopup(BuildContext context) {
    TextEditingController _textController=TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 400.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding:  EdgeInsets.all(10.sp),
                      child: SvgPicture.asset(
                          'assets/icons/email (2).svg',
                          height: 20.h, // Adjust height as needed
                          width: 20.w  // Adjust width as needed
                      ),
                    ),
                    hintText: 'Email Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 10.h), // Adjust top padding to align text with icon
                  ),
                  style: TextStyle(height: 1.5), // Adjust this value if necessary
                ),
              ),
            ],
          ),
          actions: [
            Obx(()=>
               isloading.value?CircularProgressIndicator():TextButton(
                onPressed: () async{
                  isloading.value=true;
                  await Api_Interface().Car_Details_Email(_textController.text.toString());
                  isloading.value=false; // Close the popup
                  Navigator.pop(context);
                },
                child: Text("Send",
                style: TextStyle(
                  color: Colors.blue
                ),),
              ),
            ),
          ],
        );
      },
    );
  }

}
