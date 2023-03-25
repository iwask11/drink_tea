
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/provider_use.dart';
import 'package:flutter/material.dart';

itemfuture(String parameter) async{
  ProviderUse providerUse = new ProviderUse('TeaShowProvider');
  return await providerUse.queryTableBySingleField("title", parameter);;
}

titlefuture() async{
  TeaShowProvider teaShowProvider = new TeaShowProvider();
  // ProviderUse providerUse = new ProviderUse('TeaShowProvider');
  return await teaShowProvider.queryTitleInTable();
}

Widget errorView(Object? error) {return Text('$error');}
Widget loadingView(){return Text('loading...');}
