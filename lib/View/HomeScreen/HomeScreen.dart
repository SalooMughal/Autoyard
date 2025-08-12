import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/CommonController/CommonController.dart';
import 'package:autoyard/View/Auth/Auth_Screen.dart';
import 'package:autoyard/View/Auth/Email_Verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'Add to Car.dart';
import 'History.dart';
import 'Notifications.dart';
import 'ViewJobs.dart';
import '../../Widgets/Home_Screen_widget.dart';
import '../../Widgets/Widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxInt currentindex = 0.obs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CommonContoller commonContoller = Get.find<CommonContoller>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent back navigation
        return false;
      },
      child: Scaffold(

        bottomNavigationBar: Container(
          child: Container(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Container background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), // Rounded top left corner
                  topRight: Radius.circular(15), // Rounded top right corner
                ),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5), // Outline color
                  width: 1, // Outline width
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 3), // Offset (shadow at the bottom)
                  ),
                ],
              ),
              height: 75.h, // Height of the bottom navigation bar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      currentindex.value = 0;
                      setState(() {});
                    },
                    child: Obx(
                      () => Container(
                        height: 80.h,
                        width: 80.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Home.svg',
                              color: currentindex.value == 0
                                  ? Color(0xFF0DB0F4)
                                  : Color(0xFFADADAD),
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: currentindex.value == 0
                                    ? Color(0xFF0DB0F4)
                                    : Color(0xFFADADAD),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      currentindex.value = 2;
                    },
                    child: Obx(
                      () => Container(
                        height: 80.h,
                        width: 80.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Profile.svg',
                              color: currentindex.value == 2
                                  ? Color(0xFF0DB0F4)
                                  : Color(0xFFADADAD),
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: currentindex.value == 2
                                    ? Color(0xFF0DB0F4)
                                    : Color(0xFFADADAD),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
              onTap: () {
                Get.to(Notifications());
              },
              child: Padding(
                padding: EdgeInsets.only(right: 15.0.sp),
                child: SvgPicture.asset(
                  'assets/icons/notifications.svg',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            )
          ],
          title: Obx(()=>
             Column(
              children: [
                currentindex.value == 0
                    ? Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Auto',
                              style: TextStyle(
                                color: Color(0xFF004968),
                                fontSize: 20,
                                fontFamily: 'Product Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.20,
                              ),
                            ),
                            TextSpan(
                              text: 'yard',
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
                      )
                    : Text(
                        'Profile',
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
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15.0.sp),
              child: Container(
                height: 100,
                width: 100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      child: SvgPicture.asset('assets/icons/Drawer_icon.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      child: SvgPicture.asset('assets/icons/Drawer_icon.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      child: SvgPicture.asset('assets/icons/Drawer_icon.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 12.0.sp),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(
                  height: 100.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0.sp),
                      child: SvgPicture.asset(
                        'assets/icons/autoyard_icon.svg',
                        height: 70.h,
                        width: 70.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.sp),
                      child: Text(
                        'Auto Yard',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Product Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: 0.22,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  onTap: () {
                    currentindex.value = 1;
                    Get.back();
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/drawer_icons/Drawer_profile_icon.svg'),
                    title: Text(
                      'Profile',
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
                ),
                InkWell(
                  onTap: () {
                    currentindex.value = 0;
                    Get.back();
                  },
                  child: ListTile(
                    leading:
                        SvgPicture.asset('assets/drawer_icons/tow-truck.svg'),
                    title: Text(
                      'Pickups',
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
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Add_to_Car());
                  },
                  child: ListTile(
                    leading:
                        SvgPicture.asset('assets/drawer_icons/new-car.svg'),
                    title: Text(
                      'Add Car',
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
                ),
                InkWell(
                  onTap: () {
                    Get.to(History());
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/drawer_icons/Drawer_history.svg'),
                    title: Text(
                      'History',
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
                ),
                InkWell(
                  onTap: () {
                    Get.to(Notifications());
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/drawer_icons/Drawer_Notification.svg'),
                    title: Text(
                      'Notifications',
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
                ),
                SizedBox(
                  height: 120.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.0.sp),
                  child: InkWell(
                    onTap: () async {
                      commonContoller.bearertoken.value = '';
                      final box = await Hive.openBox('Credentials');
                      box.clear();
                      commonContoller.logout();

                      Get.offAll(AuthScreen());
                    },
                    child: ListTile(
                      leading:
                          SvgPicture.asset('assets/drawer_icons/logout.svg'),
                      title: Text(
                        'Logout',
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
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.sp),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'App Version ',
                          style: TextStyle(
                            color: Color(0xFF0DB0F4),
                            fontSize: 14,
                            fontFamily: 'Product Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: 0.14,
                          ),
                        ),
                        TextSpan(
                          text: '1.0.0',
                          style: TextStyle(
                            color: Color(0xFF004968),
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
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                    () => Padding(
                    padding:  EdgeInsets.only(left: 20.0, right: 20, top: 0.sp),
                    child: currentindex.value == 0 ? Home() : Profile()),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
