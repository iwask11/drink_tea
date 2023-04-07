import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/pages/menu_page/provider.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';

import '../../widgets/ListViewItem/MenuHorizontalItem.dart';
import '../../widgets/ListViewItem/MenuVerticalItem.dart';

class MenuPageView extends StatelessWidget {
  const MenuPageView({
    Key? key,
    required this.titleList,
    required this.itemsMap,
  }) : super(key: key);

  final List titleList;
  final Map<String, List<TeaShow>> itemsMap;

  ///含有banner的页面
  Widget _first_page(String title) {
    var item = itemsMap[title]!;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Card(
            elevation: 0.3, clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20.r)),
            child: Image.asset("assets/image/other/banner.jpg"),
          ),
        ),
        ListTile(title: PageTiTle(title)),
        Container(
          height: 380.h,
          child: ListView.builder(
              prototypeItem: MenuVerticalItem(info: item[0]),
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
  Widget _page(String title, double height) {
    var item = itemsMap[title]!;

    return Column(
      children: [
        ListTile(title: PageTiTle(title)),
        SizedBox(
          height: height,
          child: ListView.builder(
              physics: new NeverScrollableScrollPhysics(),
              prototypeItem: MenuHorizontalItem(info: item[1]),
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
    return Consumer<MenuProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            controller: provider.scrollController,
            itemCount: titleList.length,
            itemBuilder: (BuildContext context, int indexd) {
              ///先获得每个page页面的小标题
              String title = titleList[indexd].toString();

              ///每个page页的高度 = item的固定高度 * item数量
              double height = itemsMap[title]!.length * 210.h;
              return indexd == 0 ? _first_page(title) : _page(title, height);
            });
      },
    );
  }
}
