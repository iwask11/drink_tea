import 'package:drink_tea/db/provider/OrdersItemsAdd_provider.dart';
import 'package:drink_tea/db/provider/OrdersItems_provider.dart';
import 'package:drink_tea/db/provider/Orders_provider.dart';
import 'package:drink_tea/db/provider/Pictures_provider.dart';
import 'package:drink_tea/db/provider/TeaShowChoseText_provider.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/provider/UserAddress_provider.dart';
import 'package:drink_tea/model/Pictures.dart';

import 'provider/User_provider.dart';

class ProviderUse{
  late var dao;

  ProviderUse(tableDao){
    switch(tableDao){
      case "TeaShowProvider":
        print("TeaShowProvider");
        dao = new TeaShowProvider();
        break;
      case "TeaShowChoseTextProvider":
        print("TeaShowChoseTextProvider");
        dao = new TeaShowChoseTextProvider();
        break;
      case "OrdersProvider":
        print("OrdersProvider");
        dao = new OrdersProvider();
        break;
      case "OrdersItemsProvider":
        print("OrdersItemsProvider");
        dao = new OrdersItemsProvider();
        break;
      case "OrdersItemsAddProvider":
        print("OrdersItemsAddProvider");
        dao = new OrdersItemsAddProvider();
        break;
      case "PicturesProvider":
        print("PicturesProvider");
        dao = new PicturesProvider();
        break;
      case "UserProvider":
        print("UserProvider");
        dao = new UserProvider();
        break;
      case "UserAddressProvider":
        print("UserAddressProvider");
        dao = new UserAddressProvider();
        break;
      default:
        print("当前数据库没有这个表格！");
        break;
    }
  }

  ///插入表数据
  Future insert(msg) async {
    int i = await dao.insert(msg);
    print("插入数据：$i");
  }
  ///修改表数据
  Future update(msg, field, parameter) async {
    int i = await dao.update(msg, field, parameter);
    print("修改数据：$i");
  }
  ///删除整张表
  Future dropTable() async {
    var msg = await dao.dropTable();
    print("删除表：$msg");
  }
  ///根据id删除表数据
  Future deleteBySingleField(field, parameter) async {
    var msg = await dao.deleteBySingleField(field, parameter);
    print("删除一条数据：$msg");
  }
  ///查询全部数据列表
  Future<List<T>> queryTableAll<T>() async {
    List<T> msgs = await dao.queryTableAll();
    print("查询所有数据：$msgs");
    return msgs;
  }
  ///根据id查询数据
  Future<List<T>> queryTableBySingleField<T>(field, parameter) async {
    List<T> msg = await dao.queryTableBySingleField(field, parameter);
    print("id查找数据：$msg");
    return msg;
  }
  ///查询数据库中数据的总条数
  Future<int?> getTableCount() async{
    int? msg = await dao.getTableCount();
    print("查询数据库中数据的总条数：$msg");
    return msg;
  }

}