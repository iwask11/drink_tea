import 'package:drink_tea/db/provider/TeaShowChoseText_provider.dart';
import 'package:drink_tea/model/MenuItem.dart';
import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/model/TeaShowChoseText.dart';
import 'package:flutter/material.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:flutter_screenutil/src/size_extension.dart';


///菜单页面的状态管理页
///1. 菜单二级页面的菜单栏目数据，提供get属性供详情组件访问
///2. 菜单二级页面的显示页面详情数据

class MenuProvider extends ChangeNotifier {
  ///数据初始化、商品数据、栏目数据
  var titleList;
  Map<String, List<TeaShow>> itemsMap = Map();
  ScrollController scrollController = new ScrollController();
  List<MenuItem> btnItem = [];

  ///菜单子项加载
  List<MenuItem> get get_btnItem => btnItem;
  ///菜单商品栏目等数据初始化
  initMenu() async{
    TeaShowProvider teaShowProvider = new TeaShowProvider();
    try {
      await teaShowProvider.queryTitleInTable()
          .then((value)=> titleList = value)
          .catchError((e){print(e);});

      await Future.forEach(titleList, (item) async => {
        await teaShowProvider.queryTableBySingleField("title", item.toString())
            .then((value)=> itemsMap[item.toString()] = value!)
            .catchError((e){print(e);})
      });
    } catch (e) {
      //捕捉错误
      print(e);
    } finally {
      titleList.forEach((element) {
        btnItem.add(new MenuItem(element, false));
      });
    }

    ////转换成map格式方便使用
    Map all = {};
    all["titleList"]=titleList;
    all["itemsMap"]=itemsMap;
    all["btnItem"]=btnItem;
    print("All:::$all");
    notifyListeners();
    return all;
  }


  ///菜单点击滑动至栏目所在分页
  void menuBtnClick(index) {
    for (var element in btnItem) {element.isSelected = false;}
    btnItem[index].isSelected = true;
    String t = btnItem[index].title.toString();
    double offset = (itemsMap[t]!.length * 210.h).toDouble()*index
        +40+(index-1)*105.h+(index-5)*10.h;
    scrollController.animateTo(offset, duration: const Duration(milliseconds: 200), curve: Curves.ease);
    print("offset-------"+offset.toString());
    notifyListeners();
  }


  ///购物车
  List currentGoods = [];
  bool canlook = false;
}
