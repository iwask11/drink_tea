import 'dart:ffi';

import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class MenuVerticalItem extends StatelessWidget {
  const MenuVerticalItem({Key? key, required this.info, required this.changedCallBack,}) : super(key: key);
  final TeaShow info;
  final ValueChanged changedCallBack;


  double _getH(context) {
    final double containerHeight = context.size.height;
    print('Container height is $containerHeight');
    return containerHeight;
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200),(){
      var height = _getH(context);
      changedCallBack(height);
    });
    return Container(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(color: Color(0xffBBBBBB), width: 1.sp)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 24.w),
                  child: Image.asset(
                    info.pic_id.toString(),
                    width: 154.w, height: 144.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.w, bottom: 18.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(info.name.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.normal,),),
                      SizedBox(height: 18.h,),
                      Row(
                        children: [
                          Text("￥".toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
                          Text(info.price.toString() +"0",
                            textAlign:TextAlign.start,
                            style: TextStyle(fontSize: 34.sp,fontWeight:FontWeight.bold),),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///点击添加按钮
          // CircleAdd(true, index, value),
        ],
      ),
    );
  }
}
