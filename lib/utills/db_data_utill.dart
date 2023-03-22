
import 'dart:math';

import 'package:drink_tea/model/Orders.dart';
import 'package:drink_tea/model/OrdersItems.dart';
import 'package:drink_tea/model/OrdersItemsAdd.dart';
import 'package:drink_tea/model/Pictures.dart';
import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/model/TeaShowChoseText.dart';
import 'package:drink_tea/model/User.dart';
import 'package:drink_tea/model/UserAddress.dart';
///2020120622
String getDateTime_toNum(){
  DateTime n = DateTime.now();
  String time = n.toString().replaceAll(new RegExp(r"(\s| |-|:)"), "").substring(0,10);
  return time;
}

String getDayTime_toNum(){
  DateTime n = DateTime.now();
  String time = n.toString().replaceAll(new RegExp(r"(\s| |-|:)"), "").substring(10,14);
  return time;
}

String generateRandom(length){
  const _availableChars = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final _random = Random();
  final randomString = List.generate(length,
          (index) => _availableChars[_random.nextInt(_availableChars.length)]).join();
  return randomString;
}
///随机生成含有年月日时间+6位含有字母数字随机数的id
String generateId(String s){
  String randomId = s+"00"+generateRandom(4);
  return randomId;
}

///TeaShow add
TeaShow TeaShow_add01 = new TeaShow(
    tea_id: generateId("ts"),
    title: '轻松点餐',
    name: '四季春青茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/四季春青茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add02 = new TeaShow(
    tea_id: generateId("ts"),
    title: '再来亿遍',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add03 = new TeaShow(
    tea_id: generateId("ts"),
    title: '遇见好茶',
    name: '奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add04 = new TeaShow(
    tea_id: generateId("ts"),
    title: '美味奶茶',
    name: '冰美式',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add05 = new TeaShow(
    tea_id: generateId("ts"),
    title: '新鲜果茶',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add06 = new TeaShow(
    tea_id: generateId("ts"),
    title: '好喝咖啡',
    name: '拿铁',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add07 = new TeaShow(
    tea_id: generateId("ts"),
    title: '小食甜点',
    name: '奶油蛋糕',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add08 = new TeaShow(
    tea_id: generateId("ts"),
    title: '轻松点餐',
    name: '四季春青茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/四季春青茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add09 = new TeaShow(
    tea_id: generateId("ts"),
    title: '再来亿遍',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add10 = new TeaShow(
    tea_id: generateId("ts"),
    title: '遇见好茶',
    name: '奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add11 = new TeaShow(
    tea_id: generateId("ts"),
    title: '美味奶茶',
    name: '冰美式',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add12 = new TeaShow(
    tea_id: generateId("ts"),
    title: '新鲜果茶',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add13 = new TeaShow(
    tea_id: generateId("ts"),
    title: '好喝咖啡',
    name: '拿铁',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add14 = new TeaShow(
    tea_id: generateId("ts"),
    title: '小食甜点',
    name: '奶油蛋糕',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add15 = new TeaShow(
    tea_id: generateId("ts"),
    title: '轻松点餐',
    name: '四季春青茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/四季春青茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add16 = new TeaShow(
    tea_id: generateId("ts"),
    title: '再来亿遍',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add17 = new TeaShow(
    tea_id: generateId("ts"),
    title: '遇见好茶',
    name: '奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add18 = new TeaShow(
    tea_id: generateId("ts"),
    title: '美味奶茶',
    name: '冰美式',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add19 = new TeaShow(
    tea_id: generateId("ts"),
    title: '新鲜果茶',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add20 = new TeaShow(
    tea_id: generateId("ts"),
    title: '好喝咖啡',
    name: '拿铁',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add21 = new TeaShow(
    tea_id: generateId("ts"),
    title: '小食甜点',
    name: '奶油蛋糕',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add22 = new TeaShow(
    tea_id: generateId("ts"),
    title: '轻松点餐',
    name: '四季春青茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/四季春青茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add23 = new TeaShow(
    tea_id: generateId("ts"),
    title: '再来亿遍',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add24 = new TeaShow(
    tea_id: generateId("ts"),
    title: '遇见好茶',
    name: '奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add25 = new TeaShow(
    tea_id: generateId("ts"),
    title: '美味奶茶',
    name: '冰美式',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add26 = new TeaShow(
    tea_id: "ts012",
    title: '新鲜果茶',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add27 = new TeaShow(
    tea_id: "ts013",
    title: '好喝咖啡',
    name: '拿铁',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);
TeaShow TeaShow_add28 = new TeaShow(
    tea_id: "ts014",
    title: '小食甜点',
    name: '奶油蛋糕',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'tsct001'
);


TeaShow TeaShow_update01 = new TeaShow(
    tea_id: "ts001",
    title: '再来亿遍xxxx',
    name: '绿茶养乐多',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/绿茶养乐多.jpg',
    chose_id: 'tsct001xx'
);

///TeaShowChoseText add
TeaShowChoseText TeaShowChoseText_add01 = new TeaShowChoseText(
  chose_id: generateId("tsct"),
  ice: '多冰|少冰|正常冰',
  sweet: '七分糖|三分糖|五分糖|无糖',
  cap: '大杯|中杯',
  material: '红豆|燕麦|脆波波|黑珍珠|芋圆|冰淇淋|芝士奶盖',
);

TeaShowChoseText TeaShowChoseText_add02 = new TeaShowChoseText(
  chose_id: generateId("tsct"),
  ice: '多冰|少冰|正常冰|热饮',
  sweet: '七分糖|三分糖|五分糖|无糖',
  cap: '大杯（热饮只能做中杯噢///>A<///）|中杯',
  material: '红豆|燕麦|脆波波|黑珍珠|芋圆|椰果',
);

TeaShowChoseText TeaShowChoseText_add03 = new TeaShowChoseText(
  chose_id: generateId("tsct"),
  ice: '正常|热饮',
  sweet: '七分糖|三分糖|五分糖|无糖',
  cap: '大杯（热饮只能做中杯噢///>A<///）|中杯',
  material: '红豆|椰果',
);

TeaShowChoseText TeaShowChoseText_update01 = new TeaShowChoseText(
  chose_id: 'tsct003',
  ice: '冰沙',
  sweet: '七分糖|三分糖|五分糖|无糖',
  cap: '大杯',
  material: '红豆|燕麦|脆波波|黑珍珠|芋圆|椰果|(部分材料不合适添加热饮噢)',
);

///Orders add
Orders Orders_add001 = new Orders(
    orders_id: generateId("o"),
    orders_items_id: "ot001",
    user_id: "user001",
    user_address_id: "useradress001",
    price: "24",
    start_time: "2020-02-23 14:30:59",
    end_time: "2020-02-23 17:30:59",
    state: "已完成"
);

Orders Orders_add002 = new Orders(
    orders_id: generateId("o"),
    orders_items_id: "ot002",
    user_id: "user002",
    user_address_id: "useradress002",
    price: "24",
    start_time: "2020-12-23 17:30:59",
    end_time: "null",
    state: "未完成"
);

Orders Orders_add003 = new Orders(
    orders_id: generateId("o"),
    orders_items_id: "ot003",
    user_id: "user003",
    user_address_id: "useradress003",
    price: "24",
    start_time: "2023-02-23 17:30:59",
    end_time: "2023-02-23 17:30:59",
    state: "配送中"
);

Orders Orders_update003 = new Orders(
    orders_id: generateId("o"),
    orders_items_id: "ot002",
    user_id: "user003",
    user_address_id: "useradress003",
    price: "240",
    start_time: "2023-02-23 17:30:59",
    end_time: "2023-02-23 17:30:59",
    state: "已完成"
);

///OrdersItems add
OrdersItems OrdersItems_add001 = new OrdersItems(
    orders_items_id: generateId("ot"),
    orders_items_add_id: "otadd001",
    tea_id: "1",
    number: "2",
    allprice: "24",
    state: "优惠");

OrdersItems OrdersItems_add002 = new OrdersItems(
    orders_items_id: generateId("ot"),
    orders_items_add_id: "otadd002",
    tea_id: "2",
    number: "2",
    allprice: "24",
    state: "优惠");

OrdersItems OrdersItems_add003 = new OrdersItems(
    orders_items_id: generateId("ot"),
    orders_items_add_id: "otadd003",
    tea_id: "3",
    number: "3",
    allprice: "24",
    state: "优惠");

OrdersItems OrdersItems_update003 = new OrdersItems(
    orders_items_id: generateId("ot"),
    orders_items_add_id: "otadd003",
    tea_id: "3",
    number: "3",
    allprice: "62",
    state: "售罄");

///OrdersItemsAdd add
OrdersItemsAdd OrdersItemsAdd_add001 = new OrdersItemsAdd(
    orders_items_add_id: generateId("otadd"),
    material: '红豆',
    ice: '多冰',
    sweet: '七分糖',
    cap: '大杯');

OrdersItemsAdd OrdersItemsAdd_add002 = new OrdersItemsAdd(
    orders_items_add_id: generateId("otadd"),
    material: '燕麦 | 椰果',
    ice: '正常',
    sweet: '全糖',
    cap: '中杯');

OrdersItemsAdd OrdersItemsAdd_add003 = new OrdersItemsAdd(
    orders_items_add_id: generateId("otadd"),
    material: '不加',
    ice: '少冰',
    sweet: '无分糖',
    cap: '大杯');

OrdersItemsAdd OrdersItemsAdd_update003 = new OrdersItemsAdd(
    orders_items_add_id: 'otadd003',
    material: '不加',
    ice: '正常',
    sweet: '无糖',
    cap: '大杯');

///Pictures add
Pictures Pictures_add001 = new Pictures(
  pic_id: generateId("p"),
  pic_name: '四季春青茶',
  pic_classify: '纯茶',
  pic_url: 'assets/image/drink/四季春青茶.jpg',
);

Pictures  Pictures_add002 = new Pictures(
  pic_id: generateId("p"),
  pic_name: '阿萨姆奶茶',
  pic_classify: '奶茶',
  pic_url: 'assets/image/drink/阿萨姆奶茶.jpg',
);

Pictures  Pictures_add003 = new Pictures(
  pic_id: generateId("p"),
  pic_name: '冰美式',
  pic_classify: '咖啡',
  pic_url: 'assets/image/drink/冰美式.jpg',
);

Pictures  Pictures_update001 = new Pictures(
  pic_id: 'p003',
  pic_name: '拿铁',
  pic_classify: '咖啡',
  pic_url: 'assets/image/drink/拿铁.jpg',
);


User User_add001 = new User(
  user_id: generateId("user"),
  address_id: "ua001",
  username: "用户名u",
  phone: "13413522339",
  password: "2339",
);

User User_add002 = new User(
  user_id: generateId("user"),
  address_id: "ua002",
  username: "用户名r",
  phone: "13413522339",
  password: "2339",
);

User User_add003 = new User(
  user_id: generateId("user"),
  address_id: "ua001",
  username: "用户名x",
  phone: "13413522339",
  password: "2339",
);

User User_update001 = new User(
  user_id: "user001",
  address_id: "ua001",
  username: "用户名o",
  phone: "13413528888",
  password: "8888",
);


UserAddress UserAddress_add001 = new UserAddress(
  address_id: generateId("ua"),
  address_name: "家",
  address_text: "A省B市cc区七里八街xx门409号楼23B",
);

UserAddress UserAddress_add002 = new UserAddress(
  address_id: generateId("ua"),
  address_name: "公司",
  address_text: "A省B市cc区七里八街xx门万里大厦401",
);

UserAddress UserAddress_add003 = new UserAddress(
  address_id: generateId("ua"),
  address_name: "null",
  address_text: "A省B市cca镇头西村802号果子坊",
);

UserAddress UserAddress_update001 = new UserAddress(
  address_id: "ua001",
  address_name: "null",
  address_text: "AA省BB市CC区七里八街XX门409号楼20B",
);
