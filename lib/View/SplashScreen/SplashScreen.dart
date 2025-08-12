import 'dart:developer';
import 'dart:io';

import 'package:autoyard/CommonController/CommonController.dart';
import 'package:autoyard/Widgets/Home_Screen_widget.dart';
import 'package:autoyard/Widgets/Widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../App_version/App_Version.dart';
import '../../main.dart';
import '../Auth/Auth_Screen.dart';
import '../HomeScreen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  CommonContoller commonContoller=Get.find<CommonContoller>();
  String remote_version='';
  String versionCode = "";
  String versionName = "";
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
  Future<void> _fetchVersionInfo() async {
    final versionInfo = await AppVersionInfo.getVersionInfo();
    setState(() async {
      versionCode = versionInfo['versionCode'] ?? "Unknown";
      versionName = versionInfo['versionName'] ?? "Unknown";
      log('version code ${versionCode}');
      if(Platform.isAndroid){
        final response= await FirebaseFirestore.instance.collection('Android_Version').get();
        log('remote_version ${response.docs[0]['Version']}');
        log('App_version ${versionName}');
        remote_version=response.docs[0]['Version'];
        if(remote_version.toString()==versionName.toString()){
          Future.delayed(Duration(seconds: 3), ()async {
            final box=await Hive.openBox('Credentials');
            if(box.isNotEmpty){
              commonContoller.bearertoken.value=box.get('uid');
            }
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => commonContoller.bearertoken.value.isEmpty?AuthScreen():HomeScreen()));
          });
          log('matching');
        }else{
          Get.dialog(
            AlertDialog(
              actions: [
              Container(
                height: 200,
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0,bottom: 35.0),
                          child: Text('App update available'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      InkWell(
                        onTap:()async{
                          try {
                            await launchURL('https://play.google.com/store/apps/details?id=com.autoyard.technology.app&pli=1');
                          } catch (e) {
                            print('Error: $e');
                          }
            },
                        child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Product Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.16,
                          ),
                        ),
                        width: Get.width/2,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0DB0F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                        ),
                                            ),
                      )
                      ],
                    )
                  ],
                ),
              )
              ],
            ),
          );
          log('not matching');
        }
      }
      else if(Platform.isIOS){
        final response= await FirebaseFirestore.instance.collection('Ios_Version').get();
        log('remote_version ${response.docs[0]['Version']}');
        log('App_version ${versionName}');
        remote_version=response.docs[0]['Version'];
        if(remote_version.toString()==versionName.toString()){
          Future.delayed(Duration(seconds: 3), ()async {
            final box=await Hive.openBox('Credentials');
            if(box.isNotEmpty){
              commonContoller.bearertoken.value=box.get('uid');
            }
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => commonContoller.bearertoken.value.isEmpty?AuthScreen():HomeScreen()));
          });
          log('matching');
        }else{
          Get.dialog(
            AlertDialog(
              actions: [
                Container(
                  height: 200,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0,bottom: 35.0),
                            child: Text('App update available'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:()async{
                              try {
                                await launchURL('https://apps.apple.com/us/app/auto-yard-technology/id6739565112');
                              } catch (e) {
                                print('Error: $e');
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Product Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.16,
                                ),
                              ),
                              width: Get.width/2,
                              decoration: ShapeDecoration(
                                color: Color(0xFF0DB0F4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(200),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
          log('not matching');
        }
      }

    });
  }
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message received with data: ${message.data}");

      // Display a custom dialog or alert for the notification
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (_) => AlertDialog(
          title: Text(message.notification?.title ?? 'Notification'),
          content: Text(message.notification?.body ?? 'You have a new message.'),
        ),
      );
    });

    // Handle app opened from background (notification tapped)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message received with data: ${message.data}");

      // Safely check if the notification and its properties are not null
      final notificationTitle = message.notification?.title ?? 'Notification';
      final notificationBody = message.notification?.body ?? 'You have a new message.';

      if (navigatorKey.currentContext != null) {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (_) => AlertDialog(
            title: Text(notificationTitle),
            content: Text(notificationBody),
          ),
        );
      } else {
        print("Navigator context is not available.");
      }
    });
    _fetchVersionInfo();


    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/truck_picutre.png'),
            fit: BoxFit.cover)
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/App_Icon.png',
                height: 100,
                width: 100,),
                SizedBox(height: 20.h,),
                Text(
                  'Auto Yard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.24,
                  ),
                ),
              ],
            ),

                      )
        ],
      ),
    );
  }
}
