
import 'package:drink_tea/model/TeaShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class ImageOfPrice extends StatelessWidget {
  const ImageOfPrice({Key? key, required this.info}) : super(key: key);
  final List<TeaShow> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.sp, top: 20.sp, left: 30.sp, bottom: 0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: SizedBox(width: 180.w,height: 160.h,
              child: Image.asset("assets/image/drink/阿萨姆奶茶.jpg",fit: BoxFit.cover,),),
          ),
          Stack(
            children: [
              Container(
                // color: Colors.orange,
                width: 500.w,height: 160.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(info[0].name.toString(),
                        style: TextStyle(fontSize: 36.sp,fontWeight: FontWeight.bold)),
                    Text("info[0].introduce.toString()",
                        style: TextStyle(fontSize: 28.sp,color: Colors.grey)),
                    Text(info[0].introduce.toString(),
                        style: TextStyle(fontSize: 28.sp,color: Colors.grey)),
                  ],
                ),
              ),
              Positioned(
                right: 10,bottom: 5,
                child: Text(info[0].price.toString(),
                    style: TextStyle(fontSize: 40.sp,fontWeight: FontWeight.bold,color: Colors.red)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
