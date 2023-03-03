import 'package:drink_tea/widgets/aOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class TopTabPage extends StatefulWidget {
  const TopTabPage({Key? key}) : super(key: key);

  @override
  State<TopTabPage> createState() => _TopTabPageState();
}

class _TopTabPageState extends State<TopTabPage> {
  final List<Tab> labelBtn = <Tab>[
    Tab(
      height: 60.h,
      child: Container(
        width: 218.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                bottomLeft: Radius.circular(50.r))),
        child: Align(
          alignment: Alignment.center,
          child: Text("全部订单"),
        ),
      ),
    ),
    Tab(
      height: 60.h,
      child: Container(
        width: 218.w,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text("等待取餐"),
        ),
      ),
    ),
    Tab(
      height: 60.h,
      child: Container(
        width: 218.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r))),
        child: Align(
          alignment: Alignment.center,
          child: Text("未完成订单"),
        ),
      ),
    ),
  ];

  Widget orderList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          aOrder(),
          aOrder(),
          aOrder(),
          aOrder(),
          aOrder(),
          aOrder(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: DefaultTabController(
            length: labelBtn.length,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(160.h),
                child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    title: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "我的订单",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 44.sp,
                            color: Colors.white),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(76.h),
                      child: Padding(
                        // padding: const EdgeInsets.only(bottom: 8.0),
                        padding: EdgeInsets.only(bottom:20.h),
                        child: TabBar(
                          labelPadding: EdgeInsets.all(0),
                          labelColor: Colors.red,
                          unselectedLabelColor: Colors.redAccent,
                          indicator: BoxDecoration(),
                          tabs: labelBtn.toList(),
                        ),
                      ),
                    )
                ),
              ),
              body: TabBarView(
                children: [
                  orderList(),
                  orderList(),
                  orderList(),
                ],
              ),
            )),
      ),
    );
  }
}
