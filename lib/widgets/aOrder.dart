import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class aOrder extends StatelessWidget {
  const aOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //取餐方式+地址信息+状态
    Widget toptitle(){
      return Row(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Text("自提",style: TextStyle(fontSize:24.sp,color: Colors.white),),
          ),
          Text("深圳技师学院点",style: TextStyle(fontSize: 30.sp,color: Colors.black),),
          Spacer(),
          Text("已完成",style: TextStyle(fontSize: 24.sp,color: Colors.black54,),),
        ],
      );
    }
    //饮品项+金额
    Widget teainfo(){
      return Row(
        children: [
          Image.asset('assets/image/drink/k01.png',height: 100.h,fit: BoxFit.cover,),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 2.h,),
                Text("香水柠檬茶",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold),maxLines: 1, overflow: TextOverflow.ellipsis,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("三分糖/热/中",style: TextStyle(fontSize: 22.sp),),
                    Spacer(),
                    Text("x1",style: TextStyle(fontSize: 24.sp,color:Colors.grey)),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Spacer(),
                    Text("共1件商品 合计： ￥16",style: TextStyle(fontSize: 24.sp, color: Colors.black54)),
                  ],
                )
              ],
            ),
          ),
        ],
      );
    }
    //时间+评价按钮
    Widget ordertime(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("2021-10-20 13:10",style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
          ElevatedButton(
            child: Text("评价"),
            style:ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              minimumSize: MaterialStateProperty.all(Size.zero),
              padding:MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.w)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)))
            ),
            onPressed: (){},
          ),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      margin: EdgeInsets.only(bottom: 26.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        boxShadow: [BoxShadow(
          blurRadius: 10,
          offset: Offset(5.0, 5.0),
          color: Colors.black12
        )]
      ),
      child: Column(
        children: [
          toptitle(),
          Divider(
            height: 22.h,
            color: Colors.grey,
          ),
          teainfo(),
          ordertime(),
        ],
      ),
    );
  }
}