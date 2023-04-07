import 'package:drink_tea/pages/menu_page/provider.dart';
import 'package:drink_tea/utills/Item_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    Key? key,
    required this.btnItem,
  }) : super(key: key);

  final List btnItem;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: List.generate(
          btnItem.length,
              (index) => Consumer<MenuProvider>(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      child: Container(
                            alignment: Alignment.center,
                            color: btnItem[index].isSelected ? const Color(0xffffffff) : const Color(
                                0xfff1f1f1),
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: PageTiTle(btnItem[index].title.toString()),
                          ),
                      onTap: () => provider.menuBtnClick(index)
                    );
                  }),
              )
      );
  }
}
