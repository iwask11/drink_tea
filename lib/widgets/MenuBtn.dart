import 'package:drink_tea/model/MenuItem.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class MenuBtn extends StatefulWidget {
  const MenuBtn({
    Key? key,
    required this.titleList,
    required this.controller,
  }) : super(key: key);

  final List titleList;
  final ScrollController controller;

  @override
  State<MenuBtn> createState() => _MenuBtnState();
}

class _MenuBtnState extends State<MenuBtn> {
  late List<MenuItem> _btnItem;

  void initState() {
    super.initState();
    List btn_title =  widget.titleList;
    _btnItem = [];
    btn_title.forEach((element) {
      _btnItem.add(new MenuItem(element, false));
    });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          widget.titleList.length,
              (index) =>GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: _btnItem[index].isSeleced ? Color(0xffffffff) : Color(0xfff1f1f1),
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: PageTiTle(widget.titleList[index]),
            ),
            onTap: () {
              _btnItem[index].isSeleced = true;
              // controller.animateTo(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
              // _stateSetter((){});
            },
          )
      ),
    );
  }
}
