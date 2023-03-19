import 'package:drink_tea/data/IconFont.dart';
import 'package:drink_tea/pages/Order_Confirm_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class ShoppingCardStyle extends StatefulWidget {
  const ShoppingCardStyle({
    Key? key,
    required this.isDisplay,
    required this.totalDrink
  }) : super(key: key);

  final bool isDisplay;
  final int totalDrink;

  @override
  State<ShoppingCardStyle> createState() => _ShoppingCardStyleState();
}

class _ShoppingCardStyleState extends State<ShoppingCardStyle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 564.w,
      height: 160.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          //去结算按钮所在块
          Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
              width: 564.w,height: 100.h,
              decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50.r)),
                boxShadow: [BoxShadow(
                      color: Theme.of(context).dividerColor,
                      offset: Offset(0.0, 2.0), //阴影y轴偏移量
                      blurRadius: 3, //阴影模糊程度
                      spreadRadius: 0 //阴影扩散程度
                  )],
              ),
              padding: EdgeInsets.only(left: 140.w, bottom: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("￥",
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  Text((widget.totalDrink * 14).toString(),
                    style:TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),
                  )],
              ),
            ),
                GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return ConfirmOrder();}));},
              child: Container(
                  width: 194.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.r),
                        topRight: Radius.circular(50.r)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                  child: Text("去结算",
                      style: TextStyle(color: Colors.white, fontSize: 34.sp, fontWeight: FontWeight.normal))),
            ),
          ]),
          //购物车按钮
          Positioned(
            left: 14.w,
            bottom: 20.h,
            child: Stack(alignment: Alignment.topRight, children: [
              FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 2,
                onPressed: () { },
                child: Icon(IconFont.ShoppingCart_, size: 56.sp, color: Colors.white),
              ),
              Positioned(
                  right: 10.w,
                  child: Container(
                    width: 30.r,height: 30.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                    child: Text(widget.totalDrink.toString(),
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
