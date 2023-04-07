import 'dart:ffi';

import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/pages/menu_pop_page/view.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class MenuVerticalItem extends StatelessWidget {
  const MenuVerticalItem({Key? key, required this.info}) : super(key: key);
  final TeaShow info;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xffBBBBBB), width: 1.sp)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Image.asset(
                    info.pic_id.toString(),
                    width: 190.w, height: 190.h,
                    fit: BoxFit.cover,
                  ),
                ),
                TitleText(info.name),
                Container(
                  padding: const EdgeInsets.only(left: 5,right: 20),
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TagText("冰沙|夏日必点"),
                      PriceText(info.price),
                    ],
                  ),
                )
              ],
            ),
          ),

          ///点击添加按钮
          Menu_pop_pagePage(chose: info.chose_id, tea: info.tea_id),
        ],
      ),
    );
  }
}
