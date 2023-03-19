
import 'package:drink_tea/data/DataEntity.dart';
import 'package:drink_tea/data/IconFont.dart';
import 'package:drink_tea/data/data.dart';
import 'package:drink_tea/widgets/ListViewItem/MenuHorizontalItem.dart';
import 'package:drink_tea/widgets/ListViewItem/MenuVerticalItem.dart';
import 'package:drink_tea/widgets/shoppingCard.dart';
import 'package:drink_tea/widgets/topNavigationInMenu.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Order_Confirm_Page.dart';

class MenuPageCopy extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new _MenuPageCopyState();
  }
}

class _MenuPageCopyState extends State<MenuPageCopy> {
  bool iswhite = false;
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
  int currentIndex = 0;
  PageController? pageController;
  Data data = new Data();

  void initState() {
    super.initState();

    pageController = new PageController(
      initialPage: 0,
      keepPage: true,
    );

    pageController!.addListener(() {
      double offset = pageController!.offset;
      double page = pageController!.page!;
      print("pageView 滑动距离 $offset 索引： $page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
              //顶部导航条
              TopNavigationInMenu(),
              //左右栏菜单
              LeftRightGo()
            ])));
  }

  //左右栏菜单
  Widget LeftRightGo() {
    print("object$currentDrinkMany");
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Row(children: [
            //右边菜单栏
            RightGo(),
            LeftGo(),
          ]),
          //
          // //购物车详情信息
          // canpop && currentDrinkMany.length != 0
          //     ? Container(
          //     height: 542.h,
          //     width: 1.sw,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(50.r),
          //             topRight: Radius.circular(50.r)),
          //         boxShadow: [
          //           BoxShadow(
          //               color: Theme
          //                   .of(context)
          //                   .dividerColor,
          //               offset: Offset(0.0, 0.0), //阴影y轴偏移量
          //               blurRadius: 3, //阴影模糊程度
          //               spreadRadius: 0 //阴影扩散程度
          //           )
          //         ]),
          //     child: SingleChildScrollView(
          //       child: Column(children: [
          //         //小标题
          //         Container(
          //           margin: EdgeInsets.symmetric(
          //               horizontal: 46.w, vertical: 40.h),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text("已选商品"),
          //               Text("删除"),
          //             ],
          //           ),
          //         ),
          //
          //         //商品列表详情
          //         Column(
          //           children: List.generate(
          //               currentDrinkMany.length,
          //                   (indexd) =>
          //                   Stack(
          //                     alignment: Alignment.bottomLeft,
          //                     children: [
          //                       Container(
          //                         child: Row(
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           children: [
          //                             Padding(
          //                               padding: EdgeInsets.symmetric(
          //                                   vertical: 16.h, horizontal: 0.w),
          //                               child: Image.asset(
          //                                 currentDrinkMany[indexd]["pic"],
          //                                 width: 260.w,
          //                                 height: 140.h,
          //                               ),
          //                             ),
          //                             Column(
          //                               crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                               children: [
          //                                 Text(
          //                                   currentDrinkMany[indexd]["name"],
          //                                   style: TextStyle(
          //                                       color: Colors.black,
          //                                       fontSize: 36.sp),
          //                                 ),
          //                                 SizedBox(
          //                                   height: 20.h,
          //                                 ),
          //                                 Text(
          //                                   "已选：${currentDrinkMany[indexd]["cap"]}/${currentDrinkMany[indexd]["ice"]}/${currentDrinkMany[indexd]["sweet"]}",
          //                                   style: TextStyle(
          //                                       color: Theme
          //                                           .of(context)
          //                                           .dividerColor,
          //                                       fontSize: 28.sp),
          //                                 ),
          //                                 SizedBox(
          //                                   height: 10.h,
          //                                 ),
          //                                 Row(
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.end,
          //                                   children: [
          //                                     Text(
          //                                       "￥",
          //                                       style: TextStyle(
          //                                           color: Colors.red,
          //                                           fontSize: 24.sp,
          //                                           fontWeight: FontWeight.bold),
          //                                     ),
          //                                     Text(
          //                                       "${currentDrinkMany[indexd]["price"]}0",
          //                                       style: TextStyle(
          //                                           color: Colors.red,
          //                                           fontSize: 34.sp,
          //                                           fontWeight: FontWeight.bold),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       CircleInCart(indexd)
          //                     ],
          //                   )),
          //         )
          //       ]),
          //     ))
          //     : Container(),

          //底部购物车弹窗
          Positioned(
              bottom: 20.h, child: ShoppingCardStyle(isDisplay: canlook, totalDrink: totalDrink)),
        ],
      ),
    );
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

  Widget LeftGo() {
    return Expanded(
      flex: 4,
      //竖向滑动菜品 + 横向滑动菜品
      child: PageView.builder(
          onPageChanged: (int index) {
            print("当前页面是$index");
            currentIndex = index;
          },
          reverse: false,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: pageController,
          itemCount: data.menuInfo.length,
          itemBuilder: (BuildContext context, int index) {
            //一个菜品分类块
            return Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //banner图
                  index == 0
                      ? Container(
                          padding: EdgeInsets.symmetric( vertical: 30.h, horizontal: 10.w),
                          child: Center( child: Card(
                              elevation: 0.3, clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(20.r)),
                              child: Image.asset("assets/image/other/banner.jpg"),
                            ), ),
                        )
                      : Container(),

                  //小标题
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.w, 40.h, 0.w, 20.h),
                    child: Text(
                      data.menuInfo[index],
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.normal),
                    ),
                  ),

                  AList(data.menuInfo[index]),
                ],
              ),
            );
          }),
    );
  }

  Widget RightGo() {
    ///右边菜单栏
    return Container(
      color: Color(0xfff1f1f1),
      width: 177.w,
      child: Column(
        children: List.generate(
            data.menuInfo.length,
                (index) =>
                Container(
                  child: GestureDetector(
                    child: Container(
                      color: currentIndex == index && iswhite
                          ? Color(0xffffffff)
                          : Color(0xfff1f1f1),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text(
                        data.menuInfo[index],
                        style: TextStyle(fontSize: 28.sp),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        iswhite = !iswhite;
                        currentIndex = index;
                        pageController!.animateToPage(index,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease);
                      });
                    },
                  )
                )),
      ),
    );
  }

  Widget AList(_menuInfoIndex) {
    String isqingsong = "轻松点餐";

    return Column(
      children: List.generate(data.list.length,
              (index) => Container(
                  child: isqingsong == data.menuInfo[index]
                      ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(data.list[index].length,
                          (value) => data.list[index][value]["title"] ==_menuInfoIndex && isqingsong != data.menuInfo[index]
                              ? MenuVerticalItem(info: data.list[index][value])
                              : Container())))
                  //其他栏目下的图片、名称等数据
                      : Column(
                    children: List.generate(data.list[index].length,
                            (value) =>data.list[index][value]["title"] ==_menuInfoIndex && isqingsong != data.menuInfo[index]
                            ? MenuHorizontalItem(info: data.list[index][value])
                            : Container()),
                  ))),
    );
  }

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
