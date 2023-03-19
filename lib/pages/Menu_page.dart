
import 'package:drink_tea/data/DataEntity.dart';
import 'package:drink_tea/data/IconFont.dart';
import 'package:drink_tea/data/data.dart';
import 'package:drink_tea/widgets/ListViewItem/MenuHorizontalItem.dart';
import 'package:drink_tea/widgets/ListViewItem/MenuVerticalItem.dart';
import 'package:drink_tea/widgets/PageSlideView/menuWidget.dart';
import 'package:drink_tea/widgets/shoppingCard.dart';
import 'package:drink_tea/widgets/topNavigationInMenu.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Order_Confirm_Page.dart';

class MenuPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  bool iswhite = false;
  int currentIndex = 0;
  bool canadd = false;
  bool canreduce = false;
  ///点击加按钮之后在页面添加的数量和减按钮
  bool canlook = false;
  ///是否弹出菜单栏
  bool canpop = false;
  ///当前饮品有多少
  List currentDrinkMany = [];
  ///总共有多少饮品
  int totalDrink = 0;
  PageController? pageController;
  Data data = new Data();

  void initState() {
    super.initState();

    // pageController = new PageController(
    //   initialPage: 0,
    //   keepPage: true,
    // );
    //
    // pageController!.addListener(() {
    //   double offset = pageController!.offset;
    //   double page = pageController!.page!;
    //   print("pageView 滑动距离 $offset 索引： $page");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
              //顶部导航条
              TopNavigationInMenu(),
              //左右栏菜单
              MenuWidget(),
            ])));
  }
  ///
  // void LongShow() {
  //   showModalBottomSheet<int>(
  //     context: context,
  //     //一：设为true，此时为全屏展示
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //
  //     builder: (BuildContext context) {
  //       return Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10), topRight: Radius.circular(10)),
  //           color: Colors.white,
  //         ),
  //         child: SizedBox(
  //           //二：返回一个有高度的SizedBox，对话框高度就是此高度
  //           height: 942.h,
  //           child: Stack(
  //             children: [
  //               ListView.builder(
  //                 itemExtent: 50,
  //                 itemCount: 3,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return ListTile(
  //                     title: Text("$index"),
  //                     onTap: () {
  //                       // do something
  //                       print("$index");
  //                       Navigator.of(context).pop();
  //                     },
  //                   );
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }


  // Widget CircleAdd(bool isqingsong, int index, int value) {
  //   int nowmany = int.parse(data.list[index][value]["howmany"].toString());
  //
  //   return
  //     isqingsong
  //     ? nowmany != 0
  //         ? Positioned(
  //                     bottom: 24.h,
  //                     left: 125.w,
  //                     child: Container(
  //                       child: Row(
  //                         children: [
  //                           GestureDetector(
  //                             onTap: () {
  //                               setState(() {
  //                                 currentDrinkMany = [];
  //                                 if (nowmany > 0) {
  //                                   nowmany--;
  //                                   totalDrink--;
  //                                 } else
  //                                   nowmany = 0;
  //                                 data.list[index][value]["howmany"] = nowmany;
  //                                 for (int i = 0; i < data.list.length; i++) {
  //                                   for (int j = 0; j < data.list[i].length; j++) {
  //                                     if (data.list[i][j]["howmany"] != 0) {
  //                                       currentDrinkMany.add(data.list[i][j]);
  //                                     }
  //                                   }
  //                                 }
  //                                 print("currentDrinkMany:${currentDrinkMany}");
  //
  //                                 if (currentDrinkMany.isEmpty)
  //                                   canlook = false;
  //                                 else
  //                                   canlook = true;
  //                               });
  //                             },
  //                             child: Icon(
  //                               IconFont.reduce,
  //                               size: 56.sp,
  //                               color: Theme
  //                                   .of(context)
  //                                   .primaryColor,
  //                             ),
  //                           ),
  //                           Text("$nowmany"),
  //                           GestureDetector(
  //                             onTap: () {
  //                               setState(() {
  //                                 currentDrinkMany = [];
  //                                 nowmany++;
  //                                 totalDrink++;
  //
  //                                 data.list[index][value]["howmany"] = nowmany;
  //                                 for (int i = 0; i < data.list.length; i++) {
  //                                   for (int j = 0; j < data.list[i].length; j++) {
  //                                     if (data.list[i][j]["howmany"] != 0) {
  //                                       currentDrinkMany.add(data.list[i][j]);
  //                                     }
  //                                   }
  //                                 }
  //                                 print("currentDrinkMany:${currentDrinkMany}");
  //
  //                                 if (currentDrinkMany.isEmpty)
  //                                   canlook = false;
  //                                 else
  //                                   canlook = true;
  //                               });
  //                             },
  //                             child: Icon(
  //                               IconFont.add_fill,
  //                               size: 56.sp,
  //                               color: Theme
  //                                   .of(context)
  //                                   .primaryColor,
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),) : Positioned(
  //                       bottom: 24.h,
  //                       left: 184.w,
  //                       child: GestureDetector(
  //                         onTap: () {
  //                           setState(() {
  //                             currentDrinkMany = [];
  //                             nowmany++;
  //                             totalDrink++;
  //                             data.list[index][value]["howmany"] = nowmany;
  //                             for (int i = 0; i < data.list.length; i++) {
  //                               for (int j = 0; j < data.list[i].length; j++) {
  //                                 if (data.list[i][j]["howmany"] != 0) {
  //                                   currentDrinkMany.add(data.list[i][j]);
  //                                 }
  //                               }
  //                             }
  //                             print("currentDrinkMany:${currentDrinkMany}");
  //
  //                             if (currentDrinkMany.isEmpty)
  //                               canlook = false;
  //                             else
  //                               canlook = true;
  //                           });
  //                         },
  //                         child: Icon(
  //                           IconFont.add_fill,
  //                           size: 56.sp,
  //                           color: Theme
  //                               .of(context)
  //                               .primaryColor,
  //                         ),
  //                       ))
  //     : nowmany != 0
  //         ? Positioned(
  //       bottom: -4.h,
  //       right: 20.w,
  //       child: Container(
  //         child: Row(
  //           children: [
  //             GestureDetector(
  //               onTap: () {
  //                 setState(() {
  //                   canlook = !canlook;
  //                   currentDrinkMany = [];
  //                   if (nowmany > 0) {
  //                     nowmany--;
  //                     totalDrink--;
  //                   } else
  //                     nowmany = 0;
  //                   data.list[index][value]["howmany"] = nowmany;
  //                   for (int i = 0; i < data.list.length; i++) {
  //                     for (int j = 0; j < data.list[i].length; j++) {
  //                       if (data.list[i][j]["howmany"] != 0) {
  //                         currentDrinkMany.add(data.list[i][j]);
  //                       }
  //                     }
  //                   }
  //                   print("currentDrinkMany:${currentDrinkMany}");
  //
  //                   if (currentDrinkMany.isEmpty)
  //                     canlook = false;
  //                   else
  //                     canlook = true;
  //                 });
  //               },
  //               child: Icon(
  //                 IconFont.reduce,
  //                 size: 56.sp,
  //                 color: Theme
  //                     .of(context)
  //                     .primaryColor,
  //               ),
  //             ),
  //             Text("$nowmany"),
  //             GestureDetector(
  //               onTap: () {
  //                 setState(() {
  //                   canlook = !canlook;
  //                   currentDrinkMany = [];
  //                   nowmany++;
  //                   totalDrink++;
  //                   data.list[index][value]["howmany"] = nowmany;
  //                   for (int i = 0; i < data.list.length; i++) {
  //                     for (int j = 0; j < data.list[i].length; j++) {
  //                       if (data.list[i][j]["howmany"] != 0) {
  //                         currentDrinkMany.add(data.list[i][j]);
  //                       }
  //                     }
  //                   }
  //                   print("currentDrinkMany:${currentDrinkMany}");
  //
  //                   if (currentDrinkMany.isEmpty)
  //                     canlook = false;
  //                   else
  //                     canlook = true;
  //                 });
  //               },
  //               child: Icon(
  //                 IconFont.add_fill,
  //                 size: 56.sp,
  //                 color: Theme
  //                     .of(context)
  //                     .primaryColor,
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ) : Positioned(
  //     bottom: -4.h,
  //     right: 20.w,
  //     child: Container(
  //       child: Row(
  //         children: [
  //           GestureDetector(
  //             child: Icon(
  //               IconFont.add_fill,
  //               size: 56.sp,
  //               color: Theme
  //                   .of(context)
  //                   .primaryColor,
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 canlook = !canlook;
  //                 currentDrinkMany = [];
  //                 nowmany++;
  //                 totalDrink++;
  //                 data.list[index][value]["howmany"] = nowmany;
  //                 for (int i = 0; i < data.list.length; i++) {
  //                   for (int j = 0; j < data.list[i].length; j++) {
  //                     if (data.list[i][j]["howmany"] != 0) {
  //                       currentDrinkMany.add(data.list[i][j]);
  //                     }
  //                   }
  //                 }
  //                 print("currentDrinkMany:${currentDrinkMany}");
  //
  //                 if (currentDrinkMany.isEmpty)
  //                   canlook = false;
  //                 else
  //                   canlook = true;
  //               });
  //             },
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget CircleInCart(int indexd) {
  //   //bug
  //   int howmanyInDrink = currentDrinkMany[indexd]["howmany"];
  //   print("howmanyInDrink::${ currentDrinkMany[indexd]["howmany"]}");
  //   return indexd != null ? Positioned(
  //     bottom: 0.h,
  //     right: 25.w,
  //     child: Container(
  //       child: Row(
  //         children: [
  //           GestureDetector(
  //             child: Icon(
  //               IconFont.reduce,
  //               size: 56.sp,
  //               color: Theme
  //                   .of(context)
  //                   .primaryColor,
  //             ),
  //           ),
  //           Text("$howmanyInDrink"),
  //           GestureDetector(
  //             child: Icon(
  //               IconFont.add_fill,
  //               size: 56.sp,
  //               color: Theme
  //                   .of(context)
  //                   .primaryColor,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   )
  //   :Container();
  // }
}
