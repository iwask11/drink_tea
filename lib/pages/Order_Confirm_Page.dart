import 'package:drink_tea/data/IconFont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmOrder extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new _ConfirmOrderState();
  }
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  bool isouting = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.fromLTRB(40.w, 0.h, 40.w, 0.h),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/other/bg_mine.png"),
                      fit: BoxFit.cover)),
              child: ListView(children: <Widget>[
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: <Widget>[
                    //Text("<",style: TextStyle(fontSize: 25,color: Colors.white),),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.centerLeft,
                        icon: Icon(
                          Icons.chevron_left,
                          size: 52.sp,
                          color: Colors.white,
                        )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0.w, 0.h, 40.w, 0.h),
                      // color: Colors.black38,
                      child: Text(
                        "确认订单",
                        style: TextStyle(
                            height: 2.0.sp,
                            fontSize: 40.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0.h),
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    // height: 126.h,
                    alignment: Alignment(0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      boxShadow: [
                        BoxShadow(
                          // color: Colors.black38,
                          // blurRadius: 5.0,
                          // spreadRadius: ,
                          blurRadius: 7, //阴影范围
                          // spreadRadius: 5, //阴影浓度
                          offset: Offset(0.0, 3.0),
                          color: Colors.black.withOpacity(0.1), //阴影颜色
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SvgPicture.asset("assets/icon/didian.svg",width: 60.r,height: 60.r,),
                              SizedBox(
                                width: 18.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "深圳学院店",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 32.sp),
                                  ),
                                  Text(
                                    "距您202m",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 24.sp),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                // height: 25.w, width: 75.h,
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                //   borderRadius:
                                //       BorderRadius.all(Radius.circular(20.r)),
                                //   boxShadow: [
                                //     BoxShadow(
                                //       blurRadius: 5, //阴影范围
                                //       spreadRadius: 2, //阴影浓度
                                //       color:
                                //           Colors.grey.withOpacity(0.2), //阴影颜色
                                //     ),
                                //   ],
                                // ),
                                // child: Row(
                                //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Container(
                                //       margin: EdgeInsets.fromLTRB(5.w, 0, 7.w, 0),
                                //       padding: EdgeInsets.fromLTRB(10.w, 0, 5.w, 1.h),
                                //       decoration: BoxDecoration(
                                //         color: Colors.lightBlueAccent,
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(10)),
                                //         boxShadow: [
                                //           BoxShadow(
                                //             blurRadius: 3, //阴影范围
                                //             spreadRadius: 2, //阴影浓度
                                //             color: Colors.grey
                                //                 .withOpacity(0.2), //阴影颜色
                                //           ),
                                //         ],
                                //       ),
                                //       child: Text(
                                //         "自取",
                                //         style: TextStyle(
                                //             fontSize: 12, color: Colors.white),
                                //       ),
                                //     ),
                                //     // Padding(padding: const EdgeInsets.fromLTRB(5, 0, 0, 0)),
                                //     Text(
                                //       "外卖",
                                //       style: TextStyle(fontSize: 10),
                                //     )
                                //   ],
                                // ),

                                width: 156.w,
                                height: 58.h,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.w,color: Colors.grey,),
                                  borderRadius: BorderRadius.circular(34.sp),
                                ),
                                child:Row(
                                  children: [
                                    GestureDetector(
                                      child: isouting
                                          ? Container(
                                          width: 84.w,
                                          height: 52.h,
                                          margin: EdgeInsets.only(left: 1.w),
                                          // padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context).primaryColor,
                                              borderRadius: BorderRadius.circular(34.sp)),
                                          child: Center(
                                            child: Text(
                                              "自取",
                                              style: TextStyle(
                                                  fontSize: 24.sp,
                                                  color: Theme
                                                      .of(context)
                                                      .accentColor),
                                            ),
                                          ))
                                          : Container(
                                          width: 84.w,
                                          height: 52.h,
                                          margin: EdgeInsets.only(left: 70.w),
                                          // padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
                                          decoration: BoxDecoration(
                                              color: Theme
                                                  .of(context)
                                                  .primaryColor,
                                              borderRadius: BorderRadius.circular(34.sp)),
                                          child: Center(
                                            child: Text(
                                              "外卖",
                                              style: TextStyle(
                                                  fontSize: 24.sp,
                                                  color: Theme
                                                      .of(context)
                                                      .accentColor),
                                            ),
                                          )),
                                      onTap: () {
                                        setState(() {
                                          isouting = !isouting;
                                          Fluttertoast.showToast(
                                              msg: isouting ? "当前已经切换到店内自取" : "当前已经切换到外卖",
                                              timeInSecForIosWeb: 1);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        /*Container(
                            alignment: Alignment(-1,0),
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child:Text("距您202m",style: TextStyle(color: Colors.grey,fontSize: 12),),
                          )*/
                      ],
                    )),
                Container(
                    height: 400.h,
                    margin: EdgeInsets.fromLTRB(0, 40.h, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10, //阴影范围
                          offset: Offset(0.0, 3.0),
                          // spreadRadius: 5, //阴影浓度
                          color: Colors.grey.withOpacity(0.2), //阴影颜色
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/image/drink/k01.png",
                                    height: 100.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "四季春青茶",
                                        style: TextStyle(fontSize: 30.sp),
                                      ),
                                      Text("中杯/少冰/正常糖",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.grey)),
                                      Text(
                                        "x1",
                                        style: TextStyle(fontSize: 24.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "￥4",
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "￥14",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 20.sp,
                                        color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10.h, 0, 0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/image/drink/k01.png",
                                    height: 100.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "四季春青茶",
                                        style: TextStyle(fontSize: 30.sp),
                                      ),
                                      Text("中杯/少冰/正常糖",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.grey)),
                                      Text(
                                        "x1",
                                        style: TextStyle(fontSize: 24.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "￥4",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "￥14",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 10,
                                        color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 40.h, 0, 0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(IconFont.kaizhibaoxiao,
                                    size: 42.sp,color: Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(width: 16.w,),
                                  Text("优惠券",
                                      style: TextStyle(
                                        fontSize: 26.sp,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Text("[10元饮品抵用券]-￥10",
                                      style: TextStyle(
                                          fontSize: 26.sp, color: Colors.red)),
                                  SizedBox(width: 6.w,),
                                  Icon(
                                    IconFont.cuowuguanbiquxiao_yuankuang,
                                    color: Theme.of(context).dividerColor,
                                    size: 28.sp,
                                  )
                                ],
                              )
                            ],
                          ),
                          Divider(
                            height:10.h,
                            color: Colors.grey,
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10.h, 0, 0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "共优惠",
                                style: TextStyle(fontSize: 28.sp),
                              ),
                              Text(
                                "￥20",
                                style:
                                    TextStyle(fontSize: 30.sp, color: Colors.red),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(26.w, 0, 0, 0)),
                              Text(
                                "实付",
                                style: TextStyle(fontSize: 28.sp),
                              ),
                              Text(
                                "￥8",
                                style: TextStyle(
                                  fontSize: 30.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                Container(
                  height: 100.h,
                  margin: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10, //阴影范围
                        spreadRadius: 5, //阴影浓度
                        color: Colors.grey.withOpacity(0.2), //阴影颜色
                      ),
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("支付方式"),
                        Row(
                          children: [
                            Icon(IconFont.weixinzhifu,color: Colors.green,),
                            SizedBox(width: 10.w,),
                            Text("微信支付 >"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 140.h,
                  margin: EdgeInsets.fromLTRB(0, 60.h, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10, //阴影范围
                        spreadRadius: 5, //阴影浓度
                        color: Colors.grey.withOpacity(0.2), //阴影颜色
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("取餐方式"),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: SvgPicture.asset("assets/icon/xuanzhong.svg",width: 30.r,height: 30.r,),
                                ),
                                Text("店内用餐"),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: SvgPicture.asset("assets/icon/xuanzhong.svg",width: 30.r,height: 30.r,),
                                ),
                                Text("自提带走"),
                              ],
                            )
                          ],
                        ),
                        Divider(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("备注"),
                            Text(">"),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ])),
          bottomNavigationBar: Container(
            height: 130.h,
            padding:  EdgeInsets.fromLTRB(40.w, 10.h, 40.w, 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("￥8",style: TextStyle(fontSize: 44.sp,fontWeight: FontWeight.bold),),
                    Text("共优惠￥20",style: TextStyle(color: Colors.red,fontSize: 24.sp),),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  ),
                  padding:   EdgeInsets.fromLTRB(30.w, 16.h, 30.w, 16.h),
                  child: Text("去支付",style: TextStyle(fontSize:32.sp,color: Colors.white),),
                )
              ],
            ),
          )),
    );
  }
}
