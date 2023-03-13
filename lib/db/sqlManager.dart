import 'package:drink_tea/db/utill.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlManager{
  static Database? _database;
  static const int _DB_VERSION = 1;
  static const String _DB_NAME = 'drink_tea.db';

  static Future<Database?> getCurrentDateBase() async{
    if (_database == null) {
      String base_path = await getDatabasesPath();
      String path = join(base_path, _DB_NAME);
      _database = await openDatabase(path, onCreate: (db, version) {
        return db.execute(CreateTableSql());}, version: _DB_VERSION,);
    }
    return _database;
  }

  ///判定指定表是否存在
  static isTableExits(String tableName) async{
    await getCurrentDateBase();
    String sql = "select * from Sqlite_master where type = 'table' and name = '$tableName'";
    var res = await _database!.rawQuery(sql);
    return res!= null && res.length > 0;
  }

  ///关闭数据库
  static close(){
    _database?.close();
    _database = null;
  }

  ///删除数据库
  static Future<Database?> delete_db() async{
    String databasePath = await getDatabasesPath();
    String db_Name = _DB_NAME;
    String path = databasePath+db_Name;
    await deleteDatabase(path);
  }
}