import 'package:drink_tea/data/IconFont.dart';
import 'package:drink_tea/pages/menu_page/provider.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:drink_tea/pages/menu_pop_page/Image_of_price.dart';
import 'package:drink_tea/pages/menu_pop_page/menu_tag_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class Menu_pop_pagePage extends StatelessWidget {

  Menu_pop_pagePage({Key? key, required this.chose, required this.tea}) : super(key: key);
  final String chose;
  final String tea;

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) => Menu_pop_pageProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  double offset_right = 12;
  int current_num = 0;
  var bfuture;

  Widget _buildPage(BuildContext context) {
    final provider = context.read<Menu_pop_pageProvider>();

    return Positioned(
      right: 12,bottom: 5,
      child: Container(
        child: Consumer<MenuProvider>(
            builder: (context, provider, child) {
              return Row(
                children: [
                  current_num != 0 ? GestureDetector(
                    child: Icon(
                      IconFont.reduce,
                      size: 60.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ) : Container(),
                  current_num != 0 ? Text(current_num.toString()) : Container(),
                  if (child != null) child,
                ],
              );
            },
            child: GestureDetector(
              child: Icon(
                IconFont.add_fill,
                size: 60.sp,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () async {
                //弹出对话框并等待其关闭
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context){
                    return FutureBuilder(
                        future: bfuture = provider.ChosePop(chose, tea),
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          if (snapshot.hasData) {
                            return Menu_pop(snapshotd: snapshot);
                          }
                          if (snapshot.hasError) {
                            return errorView(snapshot.error);
                          }
                          if (loadingView != null) {
                            return loadingView();
                          }
                          return Center(child: CircularProgressIndicator());
                        }
                    );
                  },
                );
              },
            )
        ),
      ),
    );
  }


  Future<void> ChoeseContent(BuildContext context, provider){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context){
        return FutureBuilder(
            future: bfuture = provider.ChosePop(chose, tea),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                return Menu_pop(snapshotd: snapshot);
              }
              if (snapshot.hasError) {
                return errorView(snapshot.error);
              }
              if (loadingView != null) {
                return loadingView();
              }
              return Center(child: CircularProgressIndicator());
            }
        );
      },
    );
  }

}
///弹窗样式
class Menu_pop extends StatelessWidget {
  const Menu_pop({Key? key, snapshot, required this.snapshotd}) : super(key: key);

  final AsyncSnapshot snapshotd;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///头部图片和文字介绍
          ImageOfPrice(info: snapshotd.data["show"]),
          MenuTagWrap(chose: snapshotd.data["chose"]),
          space_h20,
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    child: Text("取消",
                      style:TextStyle(fontSize: 18),),
                    onPressed: () => Navigator.of(context).pop(), // 关闭对话框
                  ),
                ),
                Expanded(
                    child: TextButton(
                      child: Text("确定",
                        style:TextStyle(fontSize: 18),),
                      onPressed: () {
                        //关闭对话框并返回true
                        Navigator.of(context).pop(true);
                      },
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
