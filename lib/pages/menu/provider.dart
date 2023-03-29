import 'package:drink_tea/model/MenuItem.dart';
import 'package:drink_tea/model/TeaShow.dart';
import 'package:flutter/material.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class MenuProvider extends ChangeNotifier {
  ///数据初始化、商品数据、栏目数据
  var titleList;
  Map<String, List<TeaShow>> itemsMap = Map();
  ScrollController scrollController = new ScrollController();
  List<MenuItem> btnItem = [];
  bool iswhite = false;
  int currentIndex = 0;

  List<MenuItem> get get_btnItem => btnItem;
  ScrollController get get_scrollController => scrollController;

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
    Map all = {};
    all["titleList"]=titleList;
    all["itemsMap"]=itemsMap;
    all["btnItem"]=btnItem;
    notifyListeners();
    return all;
  }

  void onTap(index) {
    for (var element in btnItem) {element.isSelected = false;}
    btnItem[index].isSelected = true;
    String t = btnItem[index].title.toString();
    double offset = (itemsMap[t]!.length * 210.h).toDouble()*index
        +40+(index-1)*105.h+(index-5)*10.h;
    scrollController.animateTo(offset, duration: const Duration(milliseconds: 200), curve: Curves.ease);
    print("offset-------"+offset.toString());
    notifyListeners();
  }

}
