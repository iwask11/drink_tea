import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 60.h,
            color: Colors.red,
            child: Container(),
          ),
          Container(
            child: Row(
              children: [
                Text("头像栏目"),
                Text("头像栏目")
              ],
            ),
          ),
          Column(
            children: [
              Text("广告推文位"),
            ],
          )
        ],
      ),
    );
  }
}
