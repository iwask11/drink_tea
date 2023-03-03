import 'package:flutter/material.dart';

import 'bottomNativegation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoMenuBtn extends StatefulWidget {
  _GoMenuBtnState createState() => _GoMenuBtnState();
}

class _GoMenuBtnState extends State<GoMenuBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BottomNavigationWidget();
          }));
        },
        child: Text(
          "立即体验",
          style:
              TextStyle(fontSize: 38.sp, color: Theme.of(context).primaryColor),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.r),
                  side: BorderSide(color: Colors.blue))),
          minimumSize: MaterialStateProperty.all(Size(280.w, 110.h)),
        ));
  }
}
