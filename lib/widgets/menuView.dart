import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/utills/Future_utill.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'ListViewItem/MenuHorizontalItem.dart';
import 'ListViewItem/MenuVerticalItem.dart';

///改listview嵌套itemlistView 就可以点击的时候跳转到对应的index了。
class MenuPageView extends StatefulWidget {
  const MenuPageView({
    Key? key,
    required this.titleList,
    required this.itemsMap,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;
  final List titleList;
  final Map<String, List<TeaShow>> itemsMap;

  @override
  State<MenuPageView> createState() => _MenuPageViewState();
}

class _MenuPageViewState extends State<MenuPageView> {
  void initState(){
    super.initState();
  }

  void dispose(){
    super.dispose();
  }

  ///含有banner的页面
  Widget _first_page(String title){
    var item = widget.itemsMap[title]!;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric( vertical: 30.h, horizontal: 10.w),
          child: Card(
            elevation: 0.3, clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(20.r)),
            child: Image.asset("assets/image/other/banner.jpg"),
          ),
        ),
        ListTile(title: PageTiTle(title)),
        Container(
          height: 340.h,
          child: ListView.builder(
              prototypeItem:MenuVerticalItem(info: item[0]),
              scrollDirection: Axis.horizontal,
              itemCount: item.length,
              itemBuilder: (BuildContext context, int i) {
                return MenuVerticalItem(info: item[i]);
              }),
        )
      ],
    );
  }

  ///不含banner的item页
  Widget _page(String title, double height){
    var item = widget.itemsMap[title]!;

    return Column(
      children: [
        ListTile(title: PageTiTle(title)),
        SizedBox(
          height: height,
          child: ListView.builder(
              physics: new NeverScrollableScrollPhysics(),
              prototypeItem:MenuHorizontalItem(info: item[1]),
              itemCount: item.length,
              itemBuilder: (BuildContext context, int i) {
                return MenuHorizontalItem(info: item[i]);
              }),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      controller: widget.controller,
        itemBuilder: (BuildContext context, int index) {
          ///先获得每个page页面的小标题
          String title = widget.titleList[index].toString();
          ///每个page页的高度 = item的固定高度 * item数量
          double height = widget.itemsMap[title]!.length * 110;
          return index == 0 ? _first_page(title) : _page(title, height);
        });
  }
}
