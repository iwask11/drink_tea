import 'dart:async';

import 'package:drink_tea/data/data.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/provider_use.dart';
import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/utills/Future_utill.dart';
import 'package:drink_tea/widgets/ListViewItem/MenuHorizontalItem.dart';
import 'package:drink_tea/widgets/ListViewItem/MenuVerticalItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../MenuBtn.dart';
import '../menuView.dart';
import '../shoppingCard.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  ///点击加按钮之后在页面添加的数量和减按钮
  bool canlook = false;
  ///是否弹出菜单栏
  bool canpop = false;
  ///当前饮品有多少
  List currentDrinkMany = [];
  ///总共有多少饮品
  int totalDrink = 0;

  var _AllFuture;
  var titleList;
  Map<String, List<TeaShow>> itemsMap = Map();

  late StateSetter _stateSetter;
  late ScrollController _scrollController;
  bool iswhite = false;
  int currentIndex = 0;

  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _AllFuture = _allfuture();
    }

  _allfuture() async{
    try {
      print("_____try_____catch_____");
      print("titleList:: $titleList");
      await titlefuture().then((value)=> titleList = value).catchError((e){print(e);});
      print("titleList:: $titleList");
      await Future.forEach(titleList, (item) async => {
        print("item:: $item"),
        await itemfuture(item.toString()).then((value)=> itemsMap[item.toString()] = value).catchError((e){print(e);})
      });
    } catch (e) {
      //捕捉错误
      print(e);
    } finally {
    }
    print("itemsMap::$itemsMap");
    return true;
  }

  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: StatefulBuilder(
        builder: (BuildContext context, StateSetter setSate) {
          _stateSetter = setSate;
          return Stack(
            alignment: Alignment.center,
              children: [
                FutureBuilder(
                    future: _AllFuture,
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      if (snapshot.hasData) {
                        return Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 177.w,
                                color: Color(0xfff1f1f1),
                                child: MenuBtn(titleList: titleList, controller: _scrollController,),
                              ),
                              Expanded(
                                  child: MenuPageView(titleList: titleList, itemsMap: itemsMap,controller: _scrollController)
                              )]
                        );
                      }
                      // 错误界面
                      if (snapshot.hasError) {
                        return errorView(snapshot.error);
                      }
                      // 默认加载图
                      if (loadingView != null) {
                        return loadingView();
                      }
                      return Center(child: CircularProgressIndicator());
                    }
                ),

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


