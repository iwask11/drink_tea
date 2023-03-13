import 'package:drink_tea/db/utill.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:drink_tea/db/sqlManager.dart';

abstract class BaseProvider{
  @mustCallSuper
  GetTable();

  @mustCallSuper
  Future<Database?> getDataBase() async {
    bool isTableExits = await SqlManager.isTableExits(GetTable());
    if(isTableExits == true){
      return await SqlManager.getCurrentDateBase();
    }else{
      Database? db = await SqlManager.getCurrentDateBase();
      await db!.execute(CreateTableSql());
    }
  }
  ///关闭数据库，一般程序关闭时会关闭数据库的，根据需要判定要不要关闭
  close() async {
    return await SqlManager.close();
  }
  ///删除数据库
  deleteDateBase() async {
    return await SqlManager.delete_db();
  }
}