import 'package:drink_tea/db/provider/TeaShowChoseText_provider.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/model/MenuItem.dart';
import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/model/TeaShowChoseText.dart';
import 'package:flutter/material.dart';

///菜单页面的状态管理页
///1. 菜单二级页面弹窗的商品数据和定制数据，提供get属性供详情组件访问

class Menu_pop_pageProvider extends ChangeNotifier {

  List<TeaShowChoseText> m_list =[];
  List<TeaShow> m_tea_show = [];
  Map<String, List<MenuItem>> tag_itemMaps = {};

  List<TeaShow> get get_mTeaShow => m_tea_show;

  ///获取数据
  ChosePop(String chose, String tea) async {
    print("chose: $chose");
    print("tea: $tea");
    try {
      TeaShowChoseTextProvider teaShowChoseTextProvider = TeaShowChoseTextProvider();
      await teaShowChoseTextProvider.queryTableBySingleField("chose_id", chose)
          .then((value) => m_list = value!)
          .catchError((e) {
        print(e);
      });
      print("m_list: $m_list");
      TeaShowProvider teaShowProvider = TeaShowProvider();
      await teaShowProvider.queryTableBySingleField("tea_id", tea)
          .then((value) => m_tea_show = value!)
          .catchError((e) {
        print(e);
      });
    } catch (e) {
      //捕捉错误
      print(e);
    } finally {
      ///转换成map格式方便使用
      List<MenuItem> ice_btnItem= [];
      List<MenuItem> cap_btnItem= [];
      List<MenuItem> sweet_btnItem= [];
      List<MenuItem> material_btnItem= [];
      m_list[0].ice.split("|").toList().forEach((element) {
        ice_btnItem.add(new MenuItem(element, false));
      });
      m_list[0].cap.split("|").toList().forEach((element) {
        cap_btnItem.add(new MenuItem(element, false));
      });
      m_list[0].sweet.split("|").toList().forEach((element) {
        sweet_btnItem.add(new MenuItem(element, false));
      });
      m_list[0].material.split("|").toList().forEach((element) {
        material_btnItem.add(new MenuItem(element, false));
      });
      tag_itemMaps["ice"] = ice_btnItem;
      tag_itemMaps["cap"] = cap_btnItem;
      tag_itemMaps["sweet"] = sweet_btnItem;
      tag_itemMaps["material"] = material_btnItem;

      ////转换成map格式方便使用
      Map all = {};
      all["show"] = m_tea_show;
      all["chose"] = tag_itemMaps;
      print("All:::$all");
      notifyListeners();
      return all;
    }
  }


  ///标签点击后选中
  tag_btn_click(){
    return true;
  }
}
