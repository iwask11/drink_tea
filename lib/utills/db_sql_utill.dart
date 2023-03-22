const String _Create_TeaShow_Table_Sql = '''CREATE TABLE TeaShow(
          tea_id text PRIMARY KEY, 
          title TEXT, 
          name TEXT, 
          price TEXT, 
          introduce TEXT, 
          pic_id TEXT, 
          chose_id TEXT); ''';
const String _Create_TeaShowChoseText_Table_Sql = '''CREATE TABLE TeaShowChoseText(
          chose_id TEXT PRIMARY KEY, 
          cap TEXT,
          ice TEXT,
          sweet TEXT,
          material TEXT); ''';
const String _Create_Orders_Table_Sql = '''CREATE TABLE Orders(
          Orders_id TEXT PRIMARY KEY,
          Orders_items_id TEXT,
          user_id TEXT,
          user_address_id TEXT,
          price TEXT,
          start_time TEXT,
          end_time TEXT,
          state TEXT); ''';
const String _Create_OrdersItems_Table_Sql = '''CREATE TABLE OrdersItems(
          Orders_items_id TEXT PRIMARY KEY,
          Orders_items_add_id TEXT,
          tea_id TEXT,
          number TEXT,
          allprice TEXT,
          state TEXT); ''';
const String _Create_OrdersItemsAdd_Table_Sql = '''CREATE TABLE OrdersItemsAdd(
          Orders_items_add_id TEXT PRIMARY KEY, 
          cap TEXT,
          ice TEXT,
          sweet TEXT,
          material TEXT); ''';
const String _Create_User_Table_Sql = '''CREATE TABLE User(
          user_id TEXT PRIMARY KEY,
          address_id TEXT,
          username TEXT,
          phone TEXT,
          password TEXT); ''';
const String _Create_UserAddress_Table_Sql = '''CREATE TABLE UserAddress(
          address_id TEXT PRIMARY KEY,
          address_name TEXT,
          address_text TEXT); ''';
const String _Create_Pictures_Table_Sql = '''CREATE TABLE Pictures(
          pic_id TEXT PRIMARY KEY,
          pic_name TEXT,
          pic_classify TEXT,
          pic_url TEXT); ''';

String CreateTableSql(table) {
  late String sql;
  switch(table){
    case "TeaShow":
      print("create TeaShow");
      sql = _Create_TeaShow_Table_Sql;
      break;
    case "TeaShowChoseText":
      print("create TeaShowChoseText");
      sql = _Create_TeaShowChoseText_Table_Sql;
      break;
    case "Orders":
      print("create Orders");
      sql = _Create_Orders_Table_Sql;
      break;
    case "OrdersItems":
      print("create OrdersItems");
      sql = _Create_OrdersItems_Table_Sql;
      break;
    case "OrdersItemsAdd":
      print("create OrdersItemsAdd");
      sql = _Create_OrdersItemsAdd_Table_Sql;
      break;
    case "Pictures":
      print("create Pictures");
      sql = _Create_Pictures_Table_Sql;
      break;
    case "User":
      print("create User");
      sql = _Create_User_Table_Sql;
      break;
    case "UserAddress":
      print("create UserAddress");
      sql = _Create_UserAddress_Table_Sql;
      break;
    case "null":
      print("create All,_database = null");
      sql = _Create_TeaShow_Table_Sql+_Create_TeaShowChoseText_Table_Sql+
          _Create_Orders_Table_Sql+_Create_OrdersItems_Table_Sql+
          _Create_OrdersItemsAdd_Table_Sql+_Create_User_Table_Sql+
          _Create_UserAddress_Table_Sql+_Create_Pictures_Table_Sql;
      break;
    default:
      print("创建表格的语句失效了！");
      break;
  }
  return sql;
}
