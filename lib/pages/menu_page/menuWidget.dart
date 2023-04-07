import 'package:drink_tea/pages/menu_page/provider.dart';
import 'package:drink_tea/pages/menu_page/MenuBtn.dart';
import 'package:drink_tea/pages/menu_page/menuView.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:drink_tea/widgets/shoppingCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';


class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key, required this.menuProvider}) : super(key: key);

  final MenuProvider menuProvider;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  ///点击加按钮之后在页面添加的数量和减按钮
  bool canlook = false;
  ///是否弹出菜单栏
  bool canpop = false;
  ///当前饮品有多少
  List currentGoods = [];
  ///总共有多少饮品
  int totalNum = 3;

  var afuture;


  void initState(){
    super.initState();
    afuture = widget.menuProvider.initMenu();
  }

  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: afuture,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasData) {
              return Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 177.w,
                            color: Color(0xfff1f1f1),
                            child: MenuBtn(btnItem: snapshot.data["btnItem"]),
                          ),
                          Expanded(
                              child: MenuPageView(titleList: snapshot.data["titleList"], itemsMap: snapshot.data["itemsMap"])
                          )
                        ]
                    ),
                    Positioned(
                        bottom: 30,
                        child: ShoppingCardStyle(isDisplay: canlook, totalNum: totalNum)
                    ),
                  ]
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
    );
  }
}


