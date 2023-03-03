import 'dart:developer';

import 'package:drink_tea/data/DataEntity.dart';
import 'package:drink_tea/data/IconFont.dart';
import 'package:drink_tea/widgets/topNavigationInMenu.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ConfirmOrder_Page.dart';

class MenuPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  final _topBacket = TopBacket("龙岗世贸中心店", 3.21, "非会员单笔订单满十杯送一杯，多买多送！！！");
  final List _menuInfo = ["轻松点餐", "再来亿遍", "遇见好茶", "美味奶茶", "新鲜果茶", "好喝咖啡"];

  var _list = [
    [
      {
        "title": "轻松点餐",
        "name": "四季春青茶",
        "price": 14.00,
        "pic": "assets/image/drink/四季春青茶.jpg",
        "howmany": 0,
        "id": 0,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "轻松点餐",
        "name": "美式咖啡 ",
        "price": 14.00,
        "pic": "assets/image/drink/美式咖啡.jpg",
        "howmany": 0,
        "id": 1,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "轻松点餐",
        "name": "阿萨姆奶茶",
        "price": 14.00,
        "pic": "assets/image/drink/阿萨姆奶茶.jpg",
        "howmany": 0,
        "id": 2,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
    ],
    [
      {
        "title": "再来亿遍",
        "name": "阿萨姆奶茶",
        "price": 14.00,
        "pic": "assets/image/drink/阿萨姆奶茶.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 3,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "再来亿遍",
        "name": "绿茶养乐多",
        "price": 14.00,
        "pic": "assets/image/drink/绿茶养乐多.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 4,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "再来亿遍",
        "name": "阿萨姆奶茶",
        "price": 14.00,
        "pic": "assets/image/drink/阿萨姆奶茶.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 5,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "再来亿遍",
        "name": "绿茶养乐多",
        "price": 14.00,
        "pic": "assets/image/drink/绿茶养乐多.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 6,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
    ],
    [
      {
        "title": "遇见好茶",
        "name": "茉莉绿茶",
        "price": 14.00,
        "pic": "assets/image/drink/茉莉绿茶.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 7,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "遇见好茶",
        "name": "四季春青茶",
        "price": 14.00,
        "pic": "assets/image/drink/四季春青茶.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 8,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "遇见好茶",
        "name": "茉莉绿茶",
        "price": 14.00,
        "pic": "assets/image/drink/茉莉绿茶.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 9,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "遇见好茶",
        "name": "四季春青茶",
        "price": 14.00,
        "pic": "assets/image/drink/四季春青茶.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 10,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
    ],
    [
      {
        "title": "美味奶茶",
        "name": "阿萨姆奶茶",
        "price": 14.00,
        "pic": "assets/image/drink/阿萨姆奶茶.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 11,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "美味奶茶",
        "name": "四季珍椰青",
        "price": 14.00,
        "pic": "assets/image/drink/四季珍椰青.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 12,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "美味奶茶",
        "name": "阿萨姆奶茶",
        "price": 14.00,
        "pic": "assets/image/drink/阿萨姆奶茶.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 13,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "美味奶茶",
        "name": "四季珍椰青",
        "price": 14.00,
        "pic": "assets/image/drink/四季珍椰青.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 14,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
    ],
    [
      {
        "title": "新鲜果茶",
        "name": "金桔柠檬",
        "price": 14.00,
        "pic": "assets/image/drink/金桔柠檬.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 15,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "新鲜果茶",
        "name": "柠檬四季春",
        "price": 14.00,
        "pic": "assets/image/drink/柠檬四季春.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 16,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "新鲜果茶",
        "name": "金桔柠檬",
        "price": 14.00,
        "pic": "assets/image/drink/金桔柠檬.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 17,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "新鲜果茶",
        "name": "柠檬四季春",
        "price": 14.00,
        "pic": "assets/image/drink/柠檬四季春.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 18,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
    ],
    [
      {
        "title": "好喝咖啡",
        "name": "美式咖啡",
        "price": 14.00,
        "pic": "assets/image/drink/美式咖啡.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 19,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "好喝咖啡",
        "name": "美式咖啡",
        "price": 14.00,
        "pic": "assets/image/drink/美式咖啡.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 20,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "好喝咖啡",
        "name": "美式咖啡",
        "price": 14.00,
        "pic": "assets/image/drink/美式咖啡.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 21,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
      {
        "title": "好喝咖啡",
        "name": "美式咖啡",
        "price": 14.00,
        "pic": "assets/image/drink/美式咖啡.jpg",
        "introduce": "绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。",
        "howmany": 0,
        "id": 22,
        "ice": "少冰",
        "sweet": "正常糖",
        "cap": "中杯",
        "addInDrink": "椰果",
      },
    ]
  ];

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

          //购物车详情信息
          canpop && currentDrinkMany.length != 0
              ? Container(
              height: 542.h,
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r)),
                  boxShadow: [
                    BoxShadow(
                        color: Theme
                            .of(context)
                            .dividerColor,
                        offset: Offset(0.0, 0.0), //阴影y轴偏移量
                        blurRadius: 3, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                    )
                  ]),
              child: SingleChildScrollView(
                child: Column(children: [
                  //小标题
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 46.w, vertical: 40.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("已选商品"),
                        Text("删除"),
                      ],
                    ),
                  ),

                  //商品列表详情
                  Column(
                    children: List.generate(
                        currentDrinkMany.length,
                            (indexd) =>
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.h, horizontal: 0.w),
                                        child: Image.asset(
                                          currentDrinkMany[indexd]["pic"],
                                          width: 260.w,
                                          height: 140.h,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currentDrinkMany[indexd]["name"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 36.sp),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(
                                            "已选：${currentDrinkMany[indexd]["cap"]}/${currentDrinkMany[indexd]["ice"]}/${currentDrinkMany[indexd]["sweet"]}",
                                            style: TextStyle(
                                                color: Theme
                                                    .of(context)
                                                    .dividerColor,
                                                fontSize: 28.sp),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "￥",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 24.sp,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                "${currentDrinkMany[indexd]["price"]}0",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 34.sp,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                CircleInCart(indexd)
                              ],
                            )),
                  )
                ]),
              ))
              : Container(),

          //底部购物车弹窗
          Positioned(
              bottom: 20.h, child: canlook ? ShoppingCartGo() : Container()),
        ],
      ),
    );
  }

  ///
  void LongShow() {
    showModalBottomSheet<int>(
      context: context,
      //一：设为true，此时为全屏展示
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          child: SizedBox(
            //二：返回一个有高度的SizedBox，对话框高度就是此高度
            height: 942.h,
            child: Stack(
              children: [
                ListView.builder(
                  itemExtent: 50,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () {
                        // do something
                        print("$index");
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget ShoppingCartGo() {
    return Container(
      width: 564.w,
      height: 160.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          //去结算按钮所在块
          Stack(alignment: Alignment.centerRight, children: [
            Container(
              width: 564.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50.r)),
                boxShadow: [
                  BoxShadow(
                      color: Theme
                          .of(context)
                          .dividerColor,
                      offset: Offset(0.0, 2.0), //阴影y轴偏移量
                      blurRadius: 3, //阴影模糊程度
                      spreadRadius: 0 //阴影扩散程度
                  )
                ],
              ),
              padding: EdgeInsets.only(left: 140.w, bottom: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "￥",
                    style:
                    TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (totalDrink * 14).toString(),
                    style:
                    TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ConfirmOrder();
                }));

              },
              child: Container(
                  width: 194.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.r),
                        topRight: Radius.circular(50.r)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                  child: Text("去结算",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34.sp,
                          fontWeight: FontWeight.normal))),
            ),
          ]),
          //购物车按钮
          Positioned(
            left: 14.w,
            bottom: 20.h,
            child: Stack(alignment: Alignment.topRight, children: [
              FloatingActionButton(
                backgroundColor: Theme
                    .of(context)
                    .primaryColor,
                elevation: 2,
                onPressed: () {
                  setState(() {
                    canpop = !canpop;
                  });
                },
                child: Icon(
                  IconFont.ShoppingCart_,
                  size: 56.sp,
                  color: Colors.white,
                ),
              ),
              Positioned(
                  right: 10.w,
                  child: Container(
                    width: 30.r,
                    height: 30.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Text(
                      totalDrink.toString(),
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ))
            ]),
          )
        ],
      ),
    );
  }

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
          itemCount: _menuInfo.length,
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
                    padding: EdgeInsets.symmetric(
                        vertical: 30.h, horizontal: 10.w),
                    child: Center(
                      child: Card(
                        elevation: 0.3,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadiusDirectional.circular(20.r)),
                        child:
                        Image.asset("assets/image/other/banner.jpg"),
                      ),
                    ),
                  )
                      : Container(),

                  //小标题
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.w, 40.h, 0.w, 20.h),
                    child: Text(
                      _menuInfo[index],
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.normal),
                    ),
                  ),

                  AList(_menuInfo[index]),
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
            _menuInfo.length,
                (index) =>
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          color: currentIndex == index && iswhite
                              ? Color(0xffffffff)
                              : Color(0xfff1f1f1),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Text(
                            _menuInfo[index],
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
                    ],
                  ),
                )),
      ),
    );
  }

  Widget AList(_menuInfoIndex) {
    Widget widget_h10 = SizedBox(
      height: 5.h,
    );
    Widget widget_h5 = SizedBox(
      height: 5.h,
    );
    String isqingsong = "轻松点餐";

    return Column(
      //我要获取哪个栏目下的数据？
      children: List.generate(
          _list.length,
              (index) =>
              Container(
                  child: isqingsong == _menuInfo[index]
                      ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          _list[index].length,
                              (value) =>
                          _list[index][value]["title"] ==
                              _menuInfoIndex &&
                              isqingsong == _menuInfo[index]
                              ? Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10.sp),
                                    border: Border.all(
                                        color: Color(0xffBBBBBB),
                                        width: 1.sp)),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 22.h,
                                          horizontal: 24.w),
                                      child: Image.asset(
                                        _list[index][value]["pic"]
                                            .toString(),
                                        width: 154.w,
                                        height: 144.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 0.w, bottom: 18.h),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _list[index][value]["name"]
                                                .toString(),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 30.sp,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "￥".toString(),
                                                textAlign:
                                                TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                              ),
                                              Text(
                                                _list[index][value]
                                                ["price"]
                                                    .toString() +
                                                    "0",
                                                textAlign:
                                                TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 34.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///点击添加按钮
                              CircleAdd(true, index, value),
                            ],
                          )
                              : Container()),
                    ),
                  )
                      : Column(
                    //栏目下的图片、名称等数据
                    children: List.generate(
                        _list[index].length,
                            (value) =>
                        _list[index][value]["title"] ==
                            _menuInfoIndex &&
                            isqingsong != _menuInfo[index]
                            ? Container(
                            width: 575.w,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            margin: EdgeInsets.symmetric(vertical: 16.h),
                            child: Row(
                              children: [
                                Image.asset(
                                  _list[index][value]["pic"].toString(),
                                  width: 189.w,
                                  height: 152.h,
                                  fit: BoxFit.fitHeight,
                                ),
                                Expanded(
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Positioned(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _list[index][value]["name"]
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 30.sp,
                                                    ),
                                                  ),
                                                  widget_h10,
                                                  Text(
                                                    _list[index][value]
                                                    ["introduce"]
                                                        .toString(),
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontSize: 22.sp,
                                                        color: Color(
                                                            0xff6b6b6b)),
                                                  ),
                                                  widget_h5,
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "￥",
                                                        style: TextStyle(
                                                            fontSize: 24.sp,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                      Text(
                                                        _list[index][value]
                                                        ["price"]
                                                            .toString() +
                                                            "0".toString(),
                                                        style: TextStyle(
                                                            fontSize: 36.sp,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )),

                                        ///点击添加按钮
                                        CircleAdd(false, index, value),
                                      ],
                                    ))
                              ],
                            ))
                            : Container()),
                  ))),
    );
  }

  Widget CircleAdd(bool isqingsong, int index, int value) {
    int nowmany = int.parse(_list[index][value]["howmany"].toString());

    return isqingsong
        ? nowmany != 0
        ? Positioned(
      bottom: 24.h,
      left: 125.w,
      child: Container(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentDrinkMany = [];
                  if (nowmany > 0) {
                    nowmany--;
                    totalDrink--;
                  } else
                    nowmany = 0;
                  _list[index][value]["howmany"] = nowmany;
                  for (int i = 0; i < _list.length; i++) {
                    for (int j = 0; j < _list[i].length; j++) {
                      if (_list[i][j]["howmany"] != 0) {
                        currentDrinkMany.add(_list[i][j]);
                      }
                    }
                  }
                  print("currentDrinkMany:${currentDrinkMany}");

                  if (currentDrinkMany.isEmpty)
                    canlook = false;
                  else
                    canlook = true;
                });
              },
              child: Icon(
                IconFont.reduce,
                size: 56.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
            Text("$nowmany"),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentDrinkMany = [];
                  nowmany++;
                  totalDrink++;

                  _list[index][value]["howmany"] = nowmany;
                  for (int i = 0; i < _list.length; i++) {
                    for (int j = 0; j < _list[i].length; j++) {
                      if (_list[i][j]["howmany"] != 0) {
                        currentDrinkMany.add(_list[i][j]);
                      }
                    }
                  }
                  print("currentDrinkMany:${currentDrinkMany}");

                  if (currentDrinkMany.isEmpty)
                    canlook = false;
                  else
                    canlook = true;
                });
              },
              child: Icon(
                IconFont.add_fill,
                size: 56.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            )
          ],
        ),
      ),
    )
        : Positioned(
        bottom: 24.h,
        left: 184.w,
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDrinkMany = [];
              nowmany++;
              totalDrink++;
              _list[index][value]["howmany"] = nowmany;
              for (int i = 0; i < _list.length; i++) {
                for (int j = 0; j < _list[i].length; j++) {
                  if (_list[i][j]["howmany"] != 0) {
                    currentDrinkMany.add(_list[i][j]);
                  }
                }
              }
              print("currentDrinkMany:${currentDrinkMany}");

              if (currentDrinkMany.isEmpty)
                canlook = false;
              else
                canlook = true;
            });
          },
          child: Icon(
            IconFont.add_fill,
            size: 56.sp,
            color: Theme
                .of(context)
                .primaryColor,
          ),
        ))
        : nowmany != 0
        ? Positioned(
      bottom: -4.h,
      right: 20.w,
      child: Container(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  canlook = !canlook;
                  currentDrinkMany = [];
                  if (nowmany > 0) {
                    nowmany--;
                    totalDrink--;
                  } else
                    nowmany = 0;
                  _list[index][value]["howmany"] = nowmany;
                  for (int i = 0; i < _list.length; i++) {
                    for (int j = 0; j < _list[i].length; j++) {
                      if (_list[i][j]["howmany"] != 0) {
                        currentDrinkMany.add(_list[i][j]);
                      }
                    }
                  }
                  print("currentDrinkMany:${currentDrinkMany}");

                  if (currentDrinkMany.isEmpty)
                    canlook = false;
                  else
                    canlook = true;
                });
              },
              child: Icon(
                IconFont.reduce,
                size: 56.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
            Text("$nowmany"),
            GestureDetector(
              onTap: () {
                setState(() {
                  canlook = !canlook;
                  currentDrinkMany = [];
                  nowmany++;
                  totalDrink++;
                  _list[index][value]["howmany"] = nowmany;
                  for (int i = 0; i < _list.length; i++) {
                    for (int j = 0; j < _list[i].length; j++) {
                      if (_list[i][j]["howmany"] != 0) {
                        currentDrinkMany.add(_list[i][j]);
                      }
                    }
                  }
                  print("currentDrinkMany:${currentDrinkMany}");

                  if (currentDrinkMany.isEmpty)
                    canlook = false;
                  else
                    canlook = true;
                });
              },
              child: Icon(
                IconFont.add_fill,
                size: 56.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            )
          ],
        ),
      ),
    )
        : Positioned(
      bottom: -4.h,
      right: 20.w,
      child: Container(
        child: Row(
          children: [
            GestureDetector(
              child: Icon(
                IconFont.add_fill,
                size: 56.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              onTap: () {
                setState(() {
                  canlook = !canlook;
                  currentDrinkMany = [];
                  nowmany++;
                  totalDrink++;
                  _list[index][value]["howmany"] = nowmany;
                  for (int i = 0; i < _list.length; i++) {
                    for (int j = 0; j < _list[i].length; j++) {
                      if (_list[i][j]["howmany"] != 0) {
                        currentDrinkMany.add(_list[i][j]);
                      }
                    }
                  }
                  print("currentDrinkMany:${currentDrinkMany}");

                  if (currentDrinkMany.isEmpty)
                    canlook = false;
                  else
                    canlook = true;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget CircleInCart(int indexd) {
    //bug
    int howmanyInDrink = currentDrinkMany[indexd]["howmany"];
    print("howmanyInDrink::${ currentDrinkMany[indexd]["howmany"]}");
    return indexd != null ? Positioned(
      bottom: 0.h,
      right: 25.w,
      child: Container(
        child: Row(
          children: [
            GestureDetector(
              // onTap: () {
              //   setState(() {
              //     currentDrinkMany = [];
              //     if (howmanyInDrink > 0) {
              //       howmanyInDrink--;
              //       totalDrink--;
              //     } else howmanyInDrink = 0;
              //
              //     // currentDrinkMany[indexd]["howmany"] = howmanyInDrink;
              //     for (int i = 0; i < _list.length; i++) {
              //       for (int j = 0; j < _list[i].length; j++) {
              //         if (_list[i][j]["howmany"] != 0) {
              //           currentDrinkMany.add(_list[i][j]);
              //         }
              //       }
              //     }
              //     print("currentDrinkMany:${currentDrinkMany}");
              //
              //   });
              // },
              child: Icon(
                IconFont.reduce,
                size: 56.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
            Text("$howmanyInDrink"),
            GestureDetector(
              // onTap: () {
              //   setState(() {
              //     currentDrinkMany = [];
              //     howmanyInDrink++;
              //     totalDrink++;
              //     currentDrinkMany[indexd]["howmany"] = howmanyInDrink;
              //
              //     for (int i = 0; i < currentDrinkMany.length; i++) {
              //       if (currentDrinkMany[i]["howmany"] != 0) {
              //         currentDrinkMany.add(currentDrinkMany[i]);
              //       }
              //     }
              //
              //     print("currentDrinkMany:$currentDrinkMany");
              //   });
              // },
              child: Icon(
                IconFont.add_fill,
                size: 56.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            )
          ],
        ),
      ),
    )
    :Container();
  }
}
