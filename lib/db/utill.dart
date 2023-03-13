
import 'package:drink_tea/db/provider/TeaShowChoseText_provider.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/table_provider.dart';
import 'package:drink_tea/model/TeaShow.dart';
import 'package:drink_tea/model/TeaShowChoseText.dart';

// TeaShowChoseTextProvider tableTeaShowChoseTextProvider = TeaShowChoseTextProvider<TeaShowChoseText>(_Table_TeaShowChoseText);
const String _Table_TeaShow = 'TeaShow';
const String _Table_TeaShowChoseText = 'TeaShowChoseText';
const String _Create_TeaShow_Table_Sql = '''CREATE TABLE $_Table_TeaShow(
          tea_id text PRIMARY KEY, 
          title TEXT, 
          name TEXT, 
          price TEXT, 
          introduce TEXT, 
          pic_id TEXT, 
          chose_id TEXT);''';
const String _Create_TeaShowChoseText_Table_Sql = '''CREATE TABLE $_Table_TeaShowChoseText(
          chose_id TEXT PRIMARY KEY, 
          cap TEXT, 
          ice TEXT, 
          sweet TEXT, 
          material TEXT);''';


String CreateTableSql() {
    String sql = _Create_TeaShow_Table_Sql+_Create_TeaShowChoseText_Table_Sql;
    return sql;
}

TeaShow TeaShow_add01 = new TeaShow(
    tea_id: "1",
    title: '轻松点餐',
    name: '四季春青茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/四季春青茶.jpg',
    chose_id: 'c001'
);
TeaShow TeaShow_add02 = new TeaShow(
    tea_id: "2",
    title: '再来亿遍',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'c001'
);
TeaShow TeaShow_add03 = new TeaShow(
    tea_id: "3",
    title: '再来亿遍',
    name: '奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'c001'
);
TeaShow TeaShow_add04 = new TeaShow(
    tea_id: "4",
    title: '再来亿遍',
    name: '冰美式',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'c001'
);
TeaShow TeaShow_add05 = new TeaShow(
    tea_id: "5",
    title: '再来亿遍',
    name: '阿萨姆奶茶',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'c001'
);
TeaShow TeaShow_add06 = new TeaShow(
    tea_id: "6",
    title: '再来亿遍',
    name: '拿铁',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'c001'
);
TeaShow TeaShow_add07 = new TeaShow(
    tea_id: "7",
    title: '再来亿遍',
    name: '奶油蛋糕',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/阿萨姆奶茶.jpg',
    chose_id: 'c001'
);
TeaShow TeaShow_update01 = new TeaShow(
    tea_id: "1",
    title: '再来亿遍xxxx',
    name: '绿茶养乐多',
    price: '14.00',
    introduce: '绿茶加上汉堡待放的茉莉花熏闷而成。主要原料：茉莉绿茶。',
    pic_id: 'assets/image/drink/绿茶养乐多.jpg',
    chose_id: 'c001xx'
);

TeaShowChoseText TeaShowChoseText_add01 = new TeaShowChoseText(
    chose_id: 'c001',
    ice: '多冰|少冰|正常冰',
    sweet: '七分糖|三分糖|五分糖|无糖',
    cap: '大杯|中杯',
    material: '红豆|燕麦|脆波波|黑珍珠|芋圆|冰淇淋|芝士奶盖',
);
TeaShowChoseText TeaShowChoseText_add02 = new TeaShowChoseText(
    chose_id: 'c002',
    ice: '多冰|少冰|正常冰|热饮',
    sweet: '七分糖|三分糖|五分糖|无糖',
    cap: '大杯（热饮只能做中杯噢///>A<///）|中杯',
    material: '红豆|燕麦|脆波波|黑珍珠|芋圆|椰果',
);
TeaShowChoseText TeaShowChoseText_add03 = new TeaShowChoseText(
    chose_id: 'c003',
    ice: '正常|热饮',
    sweet: '七分糖|三分糖|五分糖|无糖',
    cap: '大杯（热饮只能做中杯噢///>A<///）|中杯',
    material: '红豆|椰果',
);
TeaShowChoseText TeaShowChoseText_update01 = new TeaShowChoseText(
    chose_id: 'c003',
    ice: '冰沙',
    sweet: '七分糖|三分糖|五分糖|无糖',
    cap: '大杯',
    material: '红豆|燕麦|脆波波|黑珍珠|芋圆|椰果|(部分材料不合适添加热饮噢)',
);
