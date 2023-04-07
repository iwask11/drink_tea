import 'package:drink_tea/widgets/topNavigationInMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menuWidget.dart';
import 'provider.dart';

/**
 * menuPage：链接商品数据，栏目数据，购物车数据
 * */

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MenuProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<MenuProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        ///顶部导航条
        TopNavigationInMenu(),
        ///左右栏菜单
        MenuWidget(menuProvider: provider),
      ])
    );
  }
}

