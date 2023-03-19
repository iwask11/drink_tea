import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../bottomNativegation.dart';
import '../goMenuBtn.dart';

class SlideItemView extends StatelessWidget {
  const SlideItemView({
    Key? key,
    required this.controller,
    required this.pages,
    required this.hasBtn,
    required this.scroll,
    required this.scrollPhysics,
  }) : super(key: key);

  final PageController controller;
  final List<String> pages;
  final Axis scroll;
  final ScrollPhysics scrollPhysics;
  final String hasBtn;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      //它设置PageView的滚动轴，可以是垂直的，也可以是水平的。
      scrollDirection: Axis.horizontal,
      //它设置页面停止拖动后的动画
      physics: new AlwaysScrollableScrollPhysics(),
      //它是控制器
      controller: controller,
      //它是条目个数
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int index) {
        return hasBtn =="yes"
            ?  Stack( alignment: Alignment.topCenter,
                children: [
                  ItemBuilder(context, index,true), btn(context),
                  index == 2 ? Positioned(bottom: 190.h, child: GoMenuBtn()) : Container(),
                ],
              )
            :  ItemBuilder(context, index, false);
      },
    );
  }

  static BoxConstraints isFill_True = BoxConstraints( maxWidth: 1.sw, maxHeight: 1.sh, minWidth: 1.sw, minHeight: 1.sh,);
  static BoxConstraints isFill_False = BoxConstraints( maxWidth: 1.sw, minWidth: 1.sw);

  ///普通的底板轮播图片view
Widget ItemBuilder(BuildContext context, int index,bool isFill) {
    return ConstrainedBox(
      constraints: isFill? isFill_True : isFill_False,
      //本地图片
      child: Image.asset( pages[index], fit: BoxFit.cover),
    );
}

Widget btn(BuildContext context){
  return Positioned(
      top: MediaQueryData.fromWindow(window).padding.top,
      right: 20.w,
      child: OutlinedButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BottomNavigationWidget();
          }));},
          child: Text("跳过", style: TextStyle(fontSize: 28.sp, color: Colors.grey)),
          style: ButtonStyle(
            //背景颜色
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              //设置按下时的背景颜色
              if (states.contains(MaterialState.pressed)) {return Colors.grey[300];}
              //默认不使用背景颜色
              return Colors.white;
            }),
            //设置水波纹颜色
            overlayColor: MaterialStateProperty.all(Colors.grey[200]),
            //设置阴影
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.r), side: BorderSide(color: Colors.blue))),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w)),
            minimumSize: MaterialStateProperty.all(Size(20.w, 10.h)),
          )));
}

}
