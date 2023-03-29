import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class MenuHorizontalItem extends StatelessWidget {
  const MenuHorizontalItem({Key? key, required this.info}) : super(key: key);
  final TeaShow info;

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 200.h,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 5),
        margin: EdgeInsets.only(bottom: 10.h),
        child: Row(
          children: [
            Image.asset(info.pic_id.toString(),
              width: 180.w, height: 180.h, fit: BoxFit.cover),
            Expanded(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Positioned(
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(info.name),
                              Spacer(),
                              TagText(info.introduce),
                              Spacer(),
                              PriceText(info.price),
                            ],
                          ),
                        )),

                    ///点击添加按钮
                    // CircleAdd(false, index, value),
                  ],
                )),
          ],
        )
    );
  }
}
