

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

getSize(c){
  var height = c.size!.height;
  var width = c.size!.width;
  print("Hight: $height  width: $width");
  return height;
}


TextTiTle28sp(String text){
  return Text(text, style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.normal),
  );
}

Widget errorView(Object? error) {return Text('$error');}
Widget loadingView(){return Text('loading...');}