import 'package:drink_tea/data/data.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/provider_use.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'ListViewItem/MenuHorizontalItem.dart';
import 'ListViewItem/MenuVerticalItem.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key, required this.currentIndex, required this.pageController}) : super(key: key);
  final int currentIndex;
  final PageController pageController;

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  late StateSetter _stateSetter;
  double aHeight = 0;

  late int _currentIndex = widget.currentIndex;
  var _aFutrue;

  Data data = new Data();

  void initState(){
    super.initState();
    _aFutrue = _future();
  }

  _future() async {
    TeaShowProvider teaShowProvider = new TeaShowProvider();
    await teaShowProvider.queryTableAll();
  }

  _MenuPage(int index, AsyncSnapshot snapshot){
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
            child: TextTiTle28sp(data.menuInfo[index].toString()),
          ),

          index == 0 ?
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: List.generate(snapshot.data.length,
                      (value) => MenuVerticalItem(info: snapshot.data[value], changedCallBack: (h) {
                    _stateSetter((){
                      aHeight = h * 3;
                    });
                  })
              )))
              : Column(children: List.generate(
              snapshot.data.length,(value) => MenuHorizontalItem(info: snapshot.data[value], changedCallBack: (h) {
            _stateSetter((){
              aHeight = h * snapshot.data.length;
            });
          })))

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setSate) {
          _stateSetter = setSate;
          return FutureBuilder(
            future: _aFutrue,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text("text:"+snapshot.data.toString()),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: aHeight,
                        curve: Curves.ease,
                        child: NotificationListener(
                          onNotification: (ScrollNotification scrollInfo) {
                            _stateSetter(() {
                              _currentIndex = widget.pageController.page!.round();
                            });
                            return true;
                          },
                          child: PageView.builder(
                              reverse: false,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              controller: widget.pageController,
                              itemCount: data.menuInfo.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _MenuPage(index, snapshot);
                              }),
                        ),
                      ),
                    ],
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
          );
        }
    );
  }
}
