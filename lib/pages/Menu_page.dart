/**
 * menuPage:菜单页入口设置，该页面下可访问【商品详情数据】、【菜单栏目数据】、【购物车数据】
 * MaterialApp：放置全局的【用户数据】、【ui数据】
 * 所有示例若不说明，默认状态管理放在顶层 MaterialApp 之上，开发者可自行定义
 */


import 'package:drink_tea/widgets/PageSlideView/menuWidget.dart';
import 'package:drink_tea/widgets/topNavigationInMenu.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
              ///顶部导航条
              TopNavigationInMenu(),
              ///左右栏菜单
              MenuWidget(),
            ])
        )
    );
  }
}
