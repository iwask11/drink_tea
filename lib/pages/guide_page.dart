import 'dart:math';
import 'dart:ui';
import 'package:drink_tea/widgets/bottomNativegation.dart';
import 'package:drink_tea/widgets/goMenuBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

///引导页
class GuidePage extends StatefulWidget {
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(body: LeftPageViewPage()),
    );
  }
}

class LeftPageViewPage extends StatefulWidget {
  // @override3
  State<StatefulWidget> createState() {
    return new LeftPageViewPageState();
  }
}

class LeftPageViewPageState extends State<LeftPageViewPage> {
  //控制器
  final PageController _controller = new PageController();

  //可滑动的页面 使用到的图片
  final List<String> _pages = <String>[
    "assets/image/guide/uv1.jpg",
    "assets/image/guide/uv2.jpg",
    "assets/image/guide/uv3.jpg",
  ];

  //构建 PageView
  PageView buildPageView() {
    //懒加载模式构建
    return PageView.builder(
      //设置滑动模式
      physics: new AlwaysScrollableScrollPhysics(),

      //添加控制器
      controller: _controller,

      //构建每一屏的视图 UI
      itemBuilder: (BuildContext context, int index) {
        return index == 2
            ? Stack(
                alignment: Alignment.topCenter,
                children: [
                  buildItemWidget(index),
                  Positioned(bottom: 190.h, child: GoMenuBtn())
                ],
              )
            : buildItemWidget(index);
      },

      //条目个数
      itemCount: _pages.length,
    );
  }

  //构建每一页的Item UI效果
  Widget buildItemWidget(int index) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1.sw,
            maxHeight: 1.sh,
            minWidth: 1.sw,
            minHeight: 1.sh,
          ),

          //本地图片
          child: Image.asset(
            _pages[index],
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: MediaQueryData.fromWindow(window).padding.top,
            right: 20.w,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BottomNavigationWidget();
                  }));
                },
                child: Text(
                  "跳过",
                  style: TextStyle(fontSize: 28.sp, color: Colors.grey),
                ),
                style: ButtonStyle(
                  //背景颜色
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    //设置按下时的背景颜色
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey[300];
                    }
                    //默认不使用背景颜色
                    return Colors.white;
                  }),
                  //设置水波纹颜色
                  overlayColor: MaterialStateProperty.all(Colors.grey[200]),
                  //设置阴影
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: BorderSide(color: Colors.blue))),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w)),
                  minimumSize: MaterialStateProperty.all(Size(20.w, 10.h)),
                )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //层叠布局
    return new Stack(
      children: <Widget>[
        //底层的PageView
        buildPageView(),

        //表层的圆点指示器
        buildPositioned(),
      ],
    );
  }

  //表层的圆点指示器
  Positioned buildPositioned() {
    return new Positioned(
      //底部对齐
      bottom: 0.0, left: 0.0, right: 0.0,
      child: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Center(
          //自定义的圆点切换指示器
          child: buildDotsIndicator(),
        ),
      ),
    );
  }

  //自定义的圆点切换指示器
  DotsIndicator buildDotsIndicator() {
    return new DotsIndicator(

        //与PageView联动的控制器
        controller: _controller,

        //小圆点的个数
        itemCount: _pages.length,

        //点击小圆点的回调
        onPageSelected: (int pageIndex) {
          //主动切换页面
          _controller.animateToPage(
            pageIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
  }
}

//自定义圆点样式
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.white70,
  }) : super(listenable: controller);

  final PageController controller;

  final int itemCount;

  final ValueChanged<int> onPageSelected;

  final Color color;

  static const double _kDotSize = 8.0;

  static const double _kMaxZoom = 2.0;

  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
