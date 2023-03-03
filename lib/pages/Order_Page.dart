import 'package:drink_tea/widgets/topTabPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPage extends StatelessWidget {
  Widget topTitle() {
    return Row(
      children: [
        Text(
          "我的订单",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 44.sp,
              color: Colors.white),
        ),
        // Spacer()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/other/bg_order.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            padding: EdgeInsets.fromLTRB(40.w, 0, 40.w, 20.h),
            child: Column(
              children: [
                TopTabPage(),
              ],
            )));
  }
}
