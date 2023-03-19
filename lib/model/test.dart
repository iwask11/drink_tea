import 'package:drink_tea/db/provider/TeaShowChoseText_provider.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/utill.dart';
import 'package:drink_tea/utills/view_future_builder.dart';
import 'package:flutter/material.dart';

import 'TeaShowChoseText.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late Future _futureTeaShow;

  void initState(){
    super.initState();
    TeaShowProvider teaShowProvider = TeaShowProvider();
    // await teaShowProvider.insert(TeaShow_add01);
    // await teaShowProvider.insert(TeaShow_add02);
    // await teaShowProvider.insert(TeaShow_add03);
    // await teaShowProvider.insert(TeaShow_add04);
    // await teaShowProvider.insert(TeaShow_add05);
    // await teaShowProvider.insert(TeaShow_add06);
    // await teaShowProvider.insert(TeaShow_add07);
    // await teaShowProvider.update(TeaShow_update01,"tea_id","1");
    teaShowProvider.queryTableBySingleField("tea_id","1");
    // await teaShowProvider.queryTableAll();
    // await teaShowProvider.getTableCount();
    // await teaShowProvider.deleteBySingleField("tea_id","7");
    // await teaShowProvider.dropTable();
    TeaShowChoseTextProvider teaShowChoseTextProvider = TeaShowChoseTextProvider();
    // await teaShowChoseTextProvider.insert(TeaShowChoseText_add01);
    // await teaShowChoseTextProvider.insert(TeaShowChoseText_add02);
    // await teaShowChoseTextProvider.insert(TeaShowChoseText_add03);
    // await teaShowChoseTextProvider.update(TeaShowChoseText_update01,"chose_id","c003");
     teaShowChoseTextProvider.queryTableBySingleField("chose_id","c002");
    // await teaShowChoseTextProvider.queryTableAll();
    // await teaShowChoseTextProvider.getTableCount();
    // await teaShowChoseTextProvider.deleteBySingleField("chose_id","c002");
    // await teaShowChoseTextProvider.dropTable();
    _futureTeaShow = TeaShowDataFunction();
  }

  void dispose() {
    super.dispose();
  }

  Future TeaShowDataFunction() async {
    // /// 延迟执行一个延时任务
    // await Future.delayed(Duration(milliseconds: 4000));
    TeaShowChoseTextProvider teaShowChoseTextProvider = TeaShowChoseTextProvider();
    return await teaShowChoseTextProvider.queryTableAll();
  }
  @override
  Widget build(BuildContext context) {
    late AsyncSnapshot snapshot;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Demo"),),
        body: Center(
          child: ViewFutureBuilder(
            future: _futureTeaShow,
            view: Container(),
          ),
        ),
      ),
    );
  }
}