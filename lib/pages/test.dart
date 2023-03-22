import 'package:drink_tea/db/provider/OrdersItemsAdd_provider.dart';
import 'package:drink_tea/db/provider/OrdersItems_provider.dart';
import 'package:drink_tea/db/provider/Orders_provider.dart';
import 'package:drink_tea/db/provider/Pictures_provider.dart';
import 'package:drink_tea/db/provider/TeaShowChoseText_provider.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/provider/UserAddress_provider.dart';
import 'package:drink_tea/db/provider/User_provider.dart';
import 'package:drink_tea/db/provider_use.dart';
import 'package:drink_tea/utills/db_utill.dart';
import 'package:flutter/material.dart';

import '../model/TeaShowChoseText.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late Future _futureTeaShow;
  var _mFutrue;

  void initState() {
    super.initState();
    TheSQLTestText();
    _mFutrue = _future();
  }

  _future() async {
    ProviderUse providerUse = new ProviderUse('TeaShowChoseTextProvider');
    _futureTeaShow = providerUse.queryTableAll();
  }

  void dispose() {
    super.dispose();
  }
///防止重绘看：https://blog.csdn.net/mengks1987/article/details/104429783
  Widget errorView(Object? error) {return Text('$error');}
  Widget loadingView(){return Text('loading...');}
  @override
  Widget build(BuildContext context) {
    late AsyncSnapshot snapshot;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Demo"),),
        body: Center(
          child: FutureBuilder(
            future: _mFutrue,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              }
              // 错误界面
              if (snapshot.hasError) {
                return errorView(snapshot.error);
              }
              // 默认加载图
              if (loadingView != null) {
                return loadingView();
              }
              return Center(child: CircularProgressIndicator());
            },
          )
        ),
      ),
    );
  }
}