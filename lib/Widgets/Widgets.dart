import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget Application_Button(String name){
  return Container(
    alignment: Alignment.center,
    height: 60,
    child: Text(
      '${name}',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Product Sans',
        fontWeight: FontWeight.w400,
        height: 0,
        letterSpacing: 0.16,
      ),
    ),
    width: Get.width*0.87,
    decoration: ShapeDecoration(
      color: Color(0xFF0DB0F4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
    ),
  );
}