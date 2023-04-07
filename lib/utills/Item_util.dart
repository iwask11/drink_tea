

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';


PriceText(String price){
  return Container(
    padding: EdgeInsets.fromLTRB(0, 5.h, 90.w, 0),
    child: Text.rich(TextSpan(
        children: [
          TextSpan(text: "￥",
              style: TextStyle(color: Colors.red,
                  fontSize: 20.sp, fontWeight: FontWeight.normal)
          ),
          TextSpan(text: price.substring(0,3),
              style: TextStyle(color: Colors.red,
                  fontSize: 32.sp,fontWeight:FontWeight.w600)
          ),
          TextSpan(text: price.substring(3,5),
              style: TextStyle(color: Colors.red,
                  fontSize: 30.sp,fontWeight:FontWeight.w600)
          )
        ]),
    ),
  );
}

TitleText(String text){
  return Text(text,
    style: TextStyle(fontSize: 30.sp),);
}

TitleText1(String text){
  return Container(
    padding: EdgeInsets.only(top: 8.h),
    child: Text(text,
      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700,),),
  );
}

PageTiTle(String text){
  return Text(text, style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.normal),
  );
}

TagText(String text){
  //Color(0xff6b6b6b)
  return Text(text,
      style: TextStyle(fontSize: 22.sp,color: Colors.grey),
      overflow:TextOverflow.ellipsis, maxLines: 2, softWrap: true);
}

Widget space_h20 = SizedBox(
  height: 20.h,
);
Widget space_h10 = SizedBox(
  height: 10.h,
);
Widget space_h5 = SizedBox(
  height: 5.h,
);
Widget space_w10 = SizedBox(
  height: 10.w,
);
Widget space_w5 = SizedBox(
  height: 5.w,
);


Widget errorView(Object? error) {return Text('$error');}
Widget loadingView(){return Text('loading...');}