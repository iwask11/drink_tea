import 'dart:async';

import 'package:drink_tea/data/data.dart';
import 'package:drink_tea/widgets/ListViewItem/MenuHorizontalItem.dart';
import 'package:drink_tea/widgets/ListViewItem/MenuVerticalItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../shoppingCard.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool iswhite = false;
  int currentIndex = 0;
  PageController? pageController;
  Data data = new Data();

  ///点击加按钮之后在页面添加的数量和减按钮
  bool canlook = false;
  ///是否弹出菜单栏
  bool canpop = false;
  ///当前饮品有多少
  List currentDrinkMany = [];
  ///总共有多少饮品
  int totalDrink = 0;

  late StateSetter _stateSetter;

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

  void dispose(){
    super.dispose();
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
                        iswhite = !iswhite;
                        currentIndex = index;
                        pageController!.animateToPage(index,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease);
                        _stateSetter((){});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatefulBuilder(
        builder: (BuildContext context, StateSetter setSate) {
          _stateSetter = setSate;
          return Stack(
            alignment: Alignment.center,
              children: [
                Row(children: [ RightGo(), LeftGo()]),
                Positioned( bottom: 30,
                    child: ShoppingCardStyle(isDisplay: canlook, totalDrink: totalDrink)
                ),
              ]
          );
        }
      ),
    );
  }
}
