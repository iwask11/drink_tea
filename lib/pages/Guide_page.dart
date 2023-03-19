import 'dart:math';
import 'dart:ui';
import 'package:drink_tea/widgets/PageSlideView/DotsIndicator.dart';
import 'package:drink_tea/widgets/PageSlideView/SlideItemView.dart';
import 'package:drink_tea/widgets/bottomNativegation.dart';
import 'package:drink_tea/widgets/goMenuBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///引导页
class GuidePage extends StatefulWidget {
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          body: SlidePicView()
      ),
    );
  }
}

class SlidePicView extends StatefulWidget {
  // @override3
  State<StatefulWidget> createState() {
    return new SlidePicViewState();
  }
}

class SlidePicViewState extends State<SlidePicView> {
  //控制器
  final PageController _controller = new PageController();

  //可滑动的页面 使用到的图片
  final List<String> _pages = <String>[
    "assets/image/guide/uv1.jpg",
    "assets/image/guide/uv2.jpg",
    "assets/image/guide/uv3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    //层叠布局
    return Stack(
      children: <Widget>[
        ///底层的PageView
        SlideItemView(
          controller: _controller,
          pages: _pages,
          hasBtn: "yes",
          scrollPhysics: new AlwaysScrollableScrollPhysics(),
          scroll: Axis.horizontal,
        ),
        ///表层的圆点指示器
        new Positioned(
          bottom: 0.0, left: 0.0, right: 0.0,
          child: new Container(
            padding: const EdgeInsets.all(40.0),
            alignment: Alignment.center,
            child: new DotsIndicator(
              //与PageView联动的控制器
                controller: _controller,
                //小圆点的个数
                itemCount: _pages.length,
                //点击小圆点的回调
                onPageSelected: (int pageIndex) {
                  //主动切换页面
                  _controller.animateToPage(pageIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                })
          ),
        )
      ],
    );
  }
}
