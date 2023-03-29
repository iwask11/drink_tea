import 'package:drink_tea/data/IconFont.dart';
import 'package:drink_tea/pages/Personal_Page.dart';
import 'package:drink_tea/pages/menu/view.dart';
import 'package:drink_tea/pages/order_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationWidget_Copy extends StatefulWidget {
  @override
  _BottomNavigationWidget_Copy_State createState() => _BottomNavigationWidget_Copy_State();
}

//底部导航栏
class _BottomNavigationWidget_Copy_State extends State<BottomNavigationWidget_Copy> {
  var _currentPage;
  int _currentIndex = 0;
  bool isClick = false;

  //初始化
  @override
  void initState() {
    super.initState();
    _currentPage = BottomBoxItemTo[_currentIndex];
  }

  //展示视图
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2.w),
                child: Icon(
                  IconFont.iconicedrink,
                  size: 46.sp,
                ),
              ),
              label: "点餐"
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2.w),
                child: Icon(
                  IconFont.ziyuan117,
                  size: 46.sp,
                ),
              ),
              label: "订单"
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2.w),
                child: Icon(
                  IconFont.ziyuan54,
                  size: 46.sp,
                ),
              ),
              label: "我的"),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _currentPage = BottomBoxItemTo[_currentIndex];
            isClick = true;
          });
        },
      ),
    );
  }

  //页面储存数组
  final List BottomBoxItemTo = [
    MenuPage(),
    OrderPage(),
    MinePage(),
  ];
}
