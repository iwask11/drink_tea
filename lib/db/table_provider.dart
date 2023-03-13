import 'dart:async';
import 'dart:core';

import 'package:drink_tea/db/sqlManager.dart';
import 'package:drink_tea/model/TeaShow.dart';
import 'package:sqflite/sqflite.dart';
import 'base_provider.dart';

class TableProvider<T extends TeaShow> extends BaseProvider{
  late String table;

  TableProvider(String table_name){table = table_name;}

  String GetTable() {return table;}

  ///插入一条消息
  Future insert(T msg) async {
    Database? db = await SqlManager.getCurrentDateBase();
    return await db!.insert(GetTable(), msg.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }
  ///修改表
  Future<int> update(T msg, String field, String parameter) async {
    Database? db = await this.getDataBase();
    int res = await db!.update(GetTable(), msg.toMap(), where: "$field = ?", whereArgs: [parameter] ,conflictAlgorithm: ConflictAlgorithm.replace,);
    return res;
  }
  ///删除
  ///根据id删除表数据
  Future deleteBySingleField(String field, String parameter) async {
    Database? db = await this.getDataBase();
    var res = await db!.delete(GetTable(),where: "$field = ?",whereArgs: [parameter]);
    return res;
  }
  ///删除整张表
  Future dropTable() async {
    Database? db = await this.getDataBase();
    var res = await db!.execute('DROP table'+ GetTable());
    return res;
  }
  ///查询表
  Future T_from_Json(List<Map<String, dynamic>> maps,String table){
    late var msgs;
    if(maps.isNotEmpty) {
      switch (table){
        case "TeaShow":
          List<TeaShow> msgs_TeaShow = maps.map((item)=> TeaShow.fromJson(item)).toList();
          msgs = msgs_TeaShow;
          break;
        case "TeaShowChoseText":
          // List<TeaShowChoseText> msgs_TeaShowChoseText= maps.map((item)=> TeaShowChoseText.fromJson(item)).toList();
          // msgs = msgs_TeaShowChoseText;
          break;
        default: print("null"); break;
      }
    }
    return msgs;
  }
  ///根据传入的查询数据
  Future queryTableBySingleField(String field, String parameter) async{
    Database? db = await this.getDataBase();
    List<Map<String, dynamic>> maps = await db!.query(GetTable(), where: "$field = ?", whereArgs: [parameter]);
    return T_from_Json(maps, GetTable());
  }
  ///查询全部数据列表
  Future queryTableAll() async{
    Database? db = await this.getDataBase();
    List<Map<String, dynamic>> maps = await db!.query(GetTable());
    return T_from_Json(maps, GetTable());
  }
  ///查询数据库中数据的总条数
  Future getTableCount() async{
    Database? db = await this.getDataBase();
    int count = Sqflite.firstIntValue(await db!.rawQuery('select count(*) from'+GetTable()));
    return count;
  }
}
