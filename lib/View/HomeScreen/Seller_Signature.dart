import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/CommonController/CommonController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
class Seller_Signature extends StatefulWidget {
  Seller_Signature({Key? key}) : super(key: key);

  @override
  _Seller_SignatureState createState() => _Seller_SignatureState();
}

class _Seller_SignatureState extends State<Seller_Signature> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  CommonContoller commonContoller=Get.find<CommonContoller>();
  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data = await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);

    if (bytes != null) {
      Uint8List pngBytes = bytes.buffer.asUint8List() ;
      commonContoller.setSignatureImage(pngBytes); // Store image in GetX controller
      Get.back();
      // You can now call the API function here or in another place
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      child: SfSignaturePad(
                          key: signatureGlobalKey,
                          backgroundColor: Colors.white,
                          strokeColor: Colors.black,
                          minimumStrokeWidth: 1.0,
                          maximumStrokeWidth: 4.0),
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)))),
              SizedBox(height: 10),
              Row(children: <Widget>[
                TextButton(
                  child: Text('Done'),
                  onPressed: _handleSaveButtonPressed,
                ),
                TextButton(
                  child: Text('Clear'),
                  onPressed: _handleClearButtonPressed,
                )
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center));
  }
}