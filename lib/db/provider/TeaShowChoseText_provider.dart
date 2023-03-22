import 'dart:async';
import 'dart:core';

import 'package:drink_tea/model/TeaShowChoseText.dart';
import 'package:sqflite/sqflite.dart';

import '../base_provider.dart';

class TeaShowChoseTextProvider extends BaseProvider {
  static const String _Table_TeaShowChoseText = 'TeaShowChoseText';

  String GetTable() {return _Table_TeaShowChoseText;}

  ///插入一条消息
  Future<int> insert(TeaShowChoseText msg) async {
    Database? db = await getDataBase();
    int? i = await db!.insert(
      GetTable(), msg.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return i;
  }
  ///修改表
  Future<int> update(TeaShowChoseText msg, String field, String parameter) async {
    Database? db = await getDataBase();
    int res = await db!.update(
      GetTable(), msg.toMap(),
      where: "$field = ?",
      whereArgs: [parameter],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return res;
  }
  ///删除
  ///根据id删除某条表数据
  Future<int> deleteBySingleField(String field, String parameter) async {
    Database? db = await getDataBase();
    int res = await db!.delete(
        GetTable(),
        where: "$field = ?",
        whereArgs: [parameter]
    );
    return res;
  }
  ///清空整张表
  Future<void> dropTable() async {
    Database? db = await getDataBase();
    var res = await db!.execute('DROP table '+GetTable());
    return res;
  }

  ///查询表
  ///根据id查询数据
  Future<TeaShowChoseText?> queryTableBySingleField(String field, String parameter) async{
    Database? db = await getDataBase();
    List<Map<String, dynamic>> maps = await db!.query(GetTable(), where: "$field = ?", whereArgs: [parameter]);
    if(maps.isNotEmpty) {
      TeaShowChoseText msg =TeaShowChoseText.fromJson(maps.first);
      print("msg-$msg");
      return msg;
    }
    return null;
  }
  ///查询全部数据列表
  Future<List<TeaShowChoseText>?> queryTableAll() async{
    Database? db = await getDataBase();
    List<Map<String, dynamic>> maps = await db!.query(GetTable());
    if(maps.isNotEmpty) {
      List<TeaShowChoseText> msgs = maps.map((item)=>TeaShowChoseText.fromJson(item)).toList();
      print("msgs-$msgs");
      return msgs;
    }
    return null;
  }
  ///查询数据库中数据的总条数
  Future<int?> getTableCount() async{
    Database? db = await getDataBase();
    int? count = Sqflite.firstIntValue(await db!.rawQuery('select count(*) from '+GetTable()));
    print("count-$count");
    return count;
  }
}
