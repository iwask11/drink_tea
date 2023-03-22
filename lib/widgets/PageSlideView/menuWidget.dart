import 'dart:async';

import 'package:drink_tea/data/data.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/provider_use.dart';
import 'package:drink_tea/model/TeaShow.dart';
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
  var _mFutrue;
  var _aFutrue;
  String currentTitle = "轻松点餐";

  void initState() {
    super.initState();
    pageController = new PageController(initialPage: 0, keepPage: true,);
  }

  void dispose(){
    super.dispose();
  }

  _TextTiTle28sp(String text){
    return Text(text, style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.normal),
    );
  }

  _MenuBtn(AsyncSnapshot snapshot){
    print("snapshot.data.toString().length[q] "+ snapshot.data[1].toString());
    return List.generate(
        snapshot.data.length,
            (index) =>GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: currentIndex == index && iswhite ? Color(0xffffffff) : Color(0xfff1f1f1),
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: _TextTiTle28sp(snapshot.data[index].toString()),
          ),
          onTap: () {
            iswhite = !iswhite;
            currentIndex = index;
            pageController!.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
            _stateSetter((){});
          },
        )
    );
  }

  _MenuView(int index, AsyncSnapshot snapshot_title){
    ProviderUse providerUse = new ProviderUse('TeaShowProvider');
    currentTitle = snapshot_title.data[index].toString();
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //banner图
          index == 0 ? Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric( vertical: 30.h, horizontal: 10.w),
            child: Card(
              elevation: 0.3, clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(20.r)),
              child: Image.asset("assets/image/other/banner.jpg"),
            ),
          ): Container(),

          //小标题
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 40.h, 0.w, 20.h),
            child: _TextTiTle28sp(currentTitle),
          ),

          FutureBuilder(
            future: providerUse.queryTableBySingleField("title",currentTitle),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                return index == 0 ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: List.generate(snapshot.data.length,
                            (value) => MenuVerticalItem(info: snapshot.data[value])
                    )))
                    : Expanded(
                      child: SingleChildScrollView(scrollDirection: Axis.vertical,
                        child: Column(children: List.generate(
                        snapshot.data.length,(value) => MenuHorizontalItem(info: snapshot.data[value])),),
                      ),
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
            },
          ),

        ],
      ),
    );
  }

  Widget errorView(Object? error) {return Text('$error');}
  Widget loadingView(){return Text('loading...');}

  @override
  Widget build(BuildContext context) {

    TeaShowProvider teaShowProvider = new TeaShowProvider();
    _aFutrue = teaShowProvider.queryTitleInTable();

    return Scaffold(
      body: StatefulBuilder(
        builder: (BuildContext context, StateSetter setSate) {
          _stateSetter = setSate;
          return Stack(
            alignment: Alignment.center,
              children: [
                FutureBuilder(
                  future: _aFutrue,
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                    return Row(children: [
                      Container(
                        width: 177.w,
                        color: Color(0xfff1f1f1),
                        child: Column(children: _MenuBtn(snapshot)),
                      ),
                      Expanded(
                        flex: 4,
                        //竖向滑动菜品 + 横向滑动菜品
                        child: PageView.builder(
                            reverse: false,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            controller: pageController,
                            itemCount: data.menuInfo.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _MenuView(index, snapshot);
                            }),
                      )
                    ]);
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
