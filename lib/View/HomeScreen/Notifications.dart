import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Profile_Edit.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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

        title: Column(
          children: [
            Text(
              'Notifications',
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

          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: Api_Interface().Get_all_Notifications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('An error occurred'));
              } else if (snapshot.hasData) {
                final response = snapshot.data;

                if (response.isEmpty) {
                  return Center(child: Text('No data available'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: response.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 333.w,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF7F7F7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    '${response[index]['data']['title']}',
                                    style: TextStyle(
                                      color: Color(0xFF004968),
                                      fontSize: 18,
                                      fontFamily: 'Product Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 0.18,
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding:  EdgeInsets.only(top: 8.0.sp),
                                    child: Text(
                                      '${response[index]['data']['message']}',
                                      style: TextStyle(
                                        color: Color(0xFF004968),
                                        fontSize: 14,
                                        fontFamily: 'Product Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 0.14,
                                      ),
                                    ),
                                  ),
                                  leading: Container(
                                    width: 55,
                                    height: 55,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset('assets/drawer_icons/operating-system.svg'),
                                    padding: const EdgeInsets.symmetric(horizontal: 19.09, vertical: 10.91),
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0DB0F4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(65.45),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Center(child: Text('No data available'));
              }
            },
          )

        ],
      ),
    );
  }
}
