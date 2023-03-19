import 'dart:io';

import 'package:drink_tea/pages/Guide_page.dart';
import 'package:drink_tea/pages/Menu_page.dart';
import 'package:drink_tea/widgets/PageSlideView/menuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: (BuildContext context,child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColorLight: Color(0xc96DBFE5),
          primaryColor: Color(0xff1492e6),
          primaryColorDark: Color(0xff6DBFE5),
          dividerColor: Color(0xffd9d9d9),
          accentColor: Color(0xffffffff),
          disabledColor: Color(0xff9b9b9b),
        ),
        home: MenuWidget(),
        // home: TestPage(),
      ),
    );
  }
}
