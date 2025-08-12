import 'package:autoyard/Api_Inteferace/Api_Interface.dart';
import 'package:autoyard/CommonController/CommonController.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'Notifications.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  DateTime? _focusDate;
  CommonContoller commonContoller=Get.find<CommonContoller>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = -1;
  bool _isLoading = false;

  Future<dynamic>? _historyFuture;
  @override
  void initState() {
    // Initialize with the current date
    _focusDate = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(_focusDate!);
    commonContoller.Selected_Date.value = formattedDate;

    // Fetch initial data
    _historyFuture = Api_Interface().Get_history_by_date(
      commonContoller.Selected_Date.value,
      commonContoller.Selected_Status.value,
    );

    _historyFuture?.then((_) {
      setState(() {
        _isLoading = false;
      });
    }).catchError((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }
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

        title: Column(
          children: [
            Text(
              'History',
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
          SizedBox(height: 20),
          EasyInfiniteDateTimeLine(
            activeColor: Colors.blue,
            controller: _controller,
            firstDate: DateTime(2023, 1, 1), // Start from January 1, 2023
            focusDate: _focusDate ?? DateTime.now(), // Set focus on current date initially
            lastDate: DateTime(2025, 12, 31), // End at December 31, 2025
              onDateChange: (selectedDate) {
                setState(() {
                  _focusDate = selectedDate;
                  String formattedDate = DateFormat('yyyy-MM-dd').format(_focusDate!);
                  commonContoller.Selected_Date.value = formattedDate;
                  _isLoading = true; // Set loading state to true
                  // Update the future
                  _historyFuture = Api_Interface().Get_history_by_date(
                    commonContoller.Selected_Date.value,
                    commonContoller.Selected_Status.value,
                  );

                  _historyFuture?.then((_) {
                    setState(() {
                      _isLoading = false; // Set loading state to false once data is loaded
                    });
                  }).catchError((_) {
                    setState(() {
                      _isLoading = false; // Set loading state to false if there's an error
                    });
                  });
                });
              }

          ),

          SizedBox(height: 20.h,),
      Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildContainer(0, 'assets/history_icons/tow-truck_history.svg', '16', 'TOTAL JOBS'),
            buildContainer(1, 'assets/history_icons/completed.svg', '12', 'COMPLETED'),
            buildContainer(2, 'assets/history_icons/accepted.svg', '12', 'PENDING'),
            buildContainer(3, 'assets/history_icons/decline.svg', '12', 'DECLINED'),
          ],
        ),
      ),
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: FutureBuilder(
              future: _historyFuture,
              builder: (context, snapshot) {
                if (_isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final response = snapshot.data;
                    if (response == null || (response is List && response.isEmpty)) {
                      return Center(child: Text('No data found'));
                    }
                    return Container(
                      height: 280.h,
                      child: ListView.builder(
                        itemCount: response.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: 333.w,

                              decoration: ShapeDecoration(
                                color: Color(0xFFF7F7F7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${response[index]['customer_name']}',
                                          style: TextStyle(
                                            color: Color(0xFF004968),
                                            fontSize: 18,
                                            fontFamily: 'Product Sans',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                            letterSpacing: 0.18,
                                          ),
                                        ),
                                        response[index]['status'] == 'pending'?Container():Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: response[index]['status'] == 'cancelled'
                                              ? SvgPicture.asset('assets/icons/cross.svg')
                                              : SvgPicture.asset('assets/icons/tick.svg'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20.0.sp),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/pickup.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0.sp),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  'PICK UP',
                                                  style: TextStyle(
                                                    color: Color(0xFFBCC2CE),
                                                    fontSize: 14,
                                                    fontFamily: 'Product Sans',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                    letterSpacing: 0.14,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  '${response[index]['address']}',
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0.sp),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/schedule.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0.sp),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  'PICK TIME',
                                                  style: TextStyle(
                                                    color: Color(0xFFBCC2CE),
                                                    fontSize: 14,
                                                    fontFamily: 'Product Sans',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                    letterSpacing: 0.14,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 109,
                                                child: Text(
                                                  '${response[index]['pickup_time']}',
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
                                              SizedBox(height: 10.h,)
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
                        },
                      ),
                    );
                  } else {
                    return Center(child: Text('No data found'));
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )


        ],
      ),
    );
  }
  Widget buildContainer(int index, String iconPath, String number, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          setState(() {
            _selectedIndex = index;
            if (label == 'COMPLETED') {
              commonContoller.Selected_Status.value = 'completed';
            } else if (label == 'PENDING') {
              commonContoller.Selected_Status.value = 'pending';
            } else if (label == 'DECLINED') {
              commonContoller.Selected_Status.value = 'cancelled';
            } else if (label == 'TOTAL JOBS') {
              commonContoller.Selected_Status.value = '';
            }

            // Set loading state and update future
            _isLoading = true;
            _historyFuture = Api_Interface().Get_history_by_date(
              commonContoller.Selected_Date.value,
              commonContoller.Selected_Status.value,
            );

            _historyFuture?.then((_) {
              setState(() {
                _isLoading = false; // Set loading state to false once data is loaded
              });
            }).catchError((_) {
              setState(() {
                _isLoading = false; // Set loading state to false if there's an error
              });
            });
          });
      });},
      child: Container(
        width: 80.w,
        height: 99.h,
        decoration: ShapeDecoration(
          color: _selectedIndex == index ? Colors.white : Color(0xFFF7F7F7),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.09,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: _selectedIndex == index ? Color(0xFF004968) : Colors.transparent, // Change the border color here
            ),
            borderRadius: BorderRadius.circular(10.88),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            SvgPicture.asset(iconPath),
            SizedBox(height: 20.h,),
            Text(
              number,
              style: TextStyle(
                color: Color(0xFF004968),
                fontSize: 14.sp,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.14,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Color(0xFFBCC2CE),
                fontSize: 10.sp,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.10,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
