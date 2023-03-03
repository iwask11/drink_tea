import 'package:drink_tea/data/DataEntity.dart';
import 'package:drink_tea/data/IconFont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TopNavigationInMenu extends StatefulWidget {
  const TopNavigationInMenu({Key? key}) : super(key: key);

  @override
  State<TopNavigationInMenu> createState() => _TopNavigationInMenuState();
}

class _TopNavigationInMenuState extends State<TopNavigationInMenu> {
  final _topBacket = TopBacket("龙岗世贸中心店", 3.21, "非会员单笔订单满十杯送一杯，多买多送！！！");

  bool isouting = false;
  //顶部导航条
  Widget TopNavigation() {
    ///点击外卖/自取切换按钮
    Widget isoutingBtn = Container(
      width: 156.w,
      height: 58.h,
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .accentColor,
        borderRadius: BorderRadius.circular(34.sp),
      ),
      child: Row(
        children: [
          GestureDetector(
            child: isouting
                ? Container(
                width: 84.w,
                height: 52.h,
                margin: EdgeInsets.only(left: 1.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  "自取",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Theme
                          .of(context)
                          .accentColor),
                ),
            )
                : Container(
                width: 84.w,
                height: 52.h,
                margin: EdgeInsets.only(left: 70.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Text(
                  "外卖",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Theme
                          .of(context)
                          .accentColor),
                ),
            ),
            onTap: () {
              setState(() {
                isouting = !isouting;
                Fluttertoast.showToast(
                    msg: isouting ? "当前已经切换到店内自取" : "当前已经切换到外卖",
                    timeInSecForIosWeb: 1);
              });
            },
          )
        ],
      ),
    );
    ///这个方式写的占位符挺短的，还挺好用
    Widget widget_w6 = SizedBox(
      width: 10.w,
    );

    return Column(
      children: [
        //地址+外卖按钮+距离+导航
        Container(
          width: 1.sw,
          height: 200.h,
          color: Theme
              .of(context)
              .primaryColor,
          padding: EdgeInsets.fromLTRB(24.w, 66.h, 24.w, 10.h),
          child: Column(
            children: [
              //导航+地点
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    IconFont.map_pin_fill,
                    size: 50.sp,
                    color: Theme
                        .of(context)
                        .accentColor,
                  ),
                  widget_w6,
                  Text(
                    _topBacket.place,
                    style: TextStyle(
                        fontSize: 32.sp,
                        color: Theme
                            .of(context)
                            .accentColor),
                  ),
                  SizedBox(
                    width: 30.w,
                    height: 40.h,
                    child: Icon(
                      IconFont.arrow_right,
                      size: 45.sp,
                      color: Theme
                          .of(context)
                          .accentColor,
                    ),
                  )
                ],
              ),

              //距离+外卖按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60.w, top: 6.h),
                    child: Text(
                      "距离您" + _topBacket.distance.toString() + "km",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.normal,
                        color: Theme
                            .of(context)
                            .accentColor,
                      ),
                    ),
                  ),

                  isoutingBtn,
                ],
              ),
            ],
          ),
        ),

        //文字横幅
        Container(
            width: 1.sw,
            color: Color(0xffF6F5F5),
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    //文字横幅文本
                    child: SvgPicture.asset(
                      "assets/icon/shangdian.svg",
                      width: 40.w,
                      height: 40.h,
                    )),
                Text(
                  _topBacket.sellText,
                  style: TextStyle(fontSize: 26.sp),
                ),
              ],
            )),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return TopNavigation();
  }

}
