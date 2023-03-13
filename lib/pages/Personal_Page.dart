import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:drink_tea/data/IconFont.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    List _text = [
      "订单","优惠券","帮助反馈","招商加盟"
    ];

    List _icon = [
      Icon(IconFont.gongzimingxi, size: 50.sp, color: Theme.of(context).primaryColor,),
      Icon(IconFont.shangyehezuo, size: 50.sp, color: Theme.of(context).primaryColor,),
      Icon(IconFont.kaizhibaoxiao, size: 50.sp, color: Theme.of(context).primaryColor,),
      Icon(IconFont.kefuguanli, size: 50.sp, color: Theme.of(context).primaryColor,),
    ];


    // TODO: implement build
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
            padding:  EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/other/bg_mine.png"),
                    fit: BoxFit.cover
                )
            ),
            child: ListView(
                padding:  EdgeInsets.fromLTRB(32.w, 70.h, 32.w, 0.h),
                children: <Widget>[
                  //头像和昵称
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        width: 130.0.r,
                        height: 130.0.r,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(width: 4.w,color: Colors.white),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/image/other/head_portrait.png",),
                            )
                        ),
                      ),
                      Padding(padding:  EdgeInsets.fromLTRB(20.w, 0, 0, 0)),
                      Text("CHY",style: TextStyle(color: Colors.white,fontSize: 60.sp,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  //菜单栏
                  Container(
                      margin:  EdgeInsets.fromLTRB(0, 40.h, 0, 0),
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        boxShadow: [BoxShadow(
                          blurRadius: 10, //阴影范围
                          offset: Offset(5.0, 5.0),
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                        ),],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding:  EdgeInsets.fromLTRB(50.w, 0, 50.w, 0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(4, (index) => Column(
                                children: [
                                  _icon[index],
                                  SizedBox(height: 8.h,),
                                  Text('${_text[index]}', style: TextStyle(
                                    color: Colors.black, fontSize: 22.sp
                                  ),),
                                ],
                              )),
                            ),
                          )
                        ],
                      )
                  ),
                  //专属定制 + 周边展示
                  Container(
                      margin:  EdgeInsets.fromLTRB(0, 26.h, 0, 40.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        boxShadow: [BoxShadow(
                          blurRadius: 10, //阴影范围
                          offset: Offset(5.0, 5.0),
                          color: Color.fromRGBO(0, 0, 0, 0.16)
                        ),],
                      ),
                      child: Container(
                        margin:  EdgeInsets.all(10.w),
                        padding:  EdgeInsets.all(30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("专属定制",style: TextStyle(color: Colors.blue,fontSize: 30.sp,fontWeight: FontWeight.bold,),),
                            Divider(height: 25.h,color: Colors.blue,thickness: 1,),
                            Padding(padding:  EdgeInsets.only(top:10.h)),
                            //横向滑动 - 推荐饮品
                            SingleChildScrollView(
                              padding:EdgeInsets.all(0),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:
                                List.generate(3, (index) => Column(
                                  children: [
                                    Image(image: AssetImage("assets/image/drink/k01.png"),width: 190.w,height: 140.h,fit: BoxFit.cover,),
                                    Text("柠檬蜂蜜",style: TextStyle(fontSize: 24.sp,),maxLines:1,overflow: TextOverflow.ellipsis,),
                                    Text("大杯/少冰/正常糖",style: TextStyle(fontSize: 16.sp),maxLines:1,overflow: TextOverflow.ellipsis,),
                                  ],
                                ),)
                                ,
                              ),
                            ),
                            //广告banner图片位置
                            Padding(padding:  EdgeInsets.only(top:48.h)),
                            Image.asset("assets/image/other/banner1.png",fit: BoxFit.fill,height: 140.h,),
                            Padding(padding:  EdgeInsets.only(top:28.h)),
                            Image.asset("assets/image/other/banner2.png",fit: BoxFit.fill,height: 140.h,),
                            Padding(padding:  EdgeInsets.only(top:48.h)),
                            //标题+分割线
                            Text("周边展示",style: TextStyle(color: Colors.blue,fontSize: 32.sp,fontWeight: FontWeight.bold,),),
                            Divider(height: 20.h,color: Colors.blue,thickness: 1,),
                            Padding(padding:  EdgeInsets.only(top:10.h)),
                            //广告商品图片位置
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:
                                List.generate(6, (index) => Row(
                                  children: [
                                    Image.asset("assets/image/other/img_1.png",fit: BoxFit.cover,height:240.h,),
                                    SizedBox(width: 10.w,)
                                  ],
                                ),),
                              ),
                            )
                          ],
                        ),
                      )
                  )
                ]
            )
        ),
      ),
    );
  }
}
