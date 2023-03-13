import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class MenuHorizontalItem extends StatelessWidget {
  const MenuHorizontalItem({Key? key, required this.info,}) : super(key: key);
  final Map info;

  @override
  Widget build(BuildContext context) {
    Widget widget_h10 = SizedBox(
      height: 5.h,
    );
    Widget widget_h5 = SizedBox(
      height: 5.h,
    );

    return Container(
        width: 575.w,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        margin: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          children: [
            Image.asset(info["pic"].toString(),
              width: 189.w, height: 152.h, fit: BoxFit.fitHeight,),
            Expanded(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Positioned(
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(info["name"].toString(),
                                style: TextStyle(fontSize: 30.sp),),
                              widget_h10,
                              Text(info["introduce"].toString(),
                                style: TextStyle(fontSize: 22.sp,color: Color(0xff6b6b6b)),
                                overflow:TextOverflow.ellipsis, maxLines: 2, softWrap: true),
                              widget_h5,
                              Row(
                                children: [
                                  Text( "￥",
                                    style: TextStyle(fontSize: 24.sp,fontWeight:FontWeight.bold),
                                  ),
                                  Text(info["price"].toString() + "0".toString(),
                                    style: TextStyle(fontSize: 36.sp,fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          ),
                        )),

                    ///点击添加按钮
                    // CircleAdd(false, index, value),
                  ],
                ))
          ],
        ));
  }
}
