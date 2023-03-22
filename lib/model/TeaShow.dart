
class TeaShow {
  late String tea_id;
  late String title;
  late String name;
  late String pic_id;
  late String introduce;
  late String price;
  late String chose_id;


  TeaShow({
    required this.tea_id,
    required this.title,
    required this.name,
    required this.pic_id,
    required this.introduce,
    required this.price,
    required this.chose_id,
  });

  TeaShow.fromJson(dynamic json){
    tea_id = json['tea_id'];
    title = json['title'];
    name = json['name'];
    pic_id = json['pic_id'];
    price = json['price'];
    introduce = json['introduce'];
    chose_id = json['chose_id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tea_id'] = tea_id;
    map['title'] = title;
    map['name'] = name;
    map['pic_id'] = pic_id;
    map['price'] = price;
    map['introduce'] = introduce;
    map['chose_id'] = chose_id;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'tea_id': tea_id,
      'title': title,
      'name': name,
      'pic_id': pic_id,
      'price': price,
      'introduce': introduce,
      'chose_id': chose_id,
    };
  }

  @override
  String toString() {
    return '''
    TeaShow{
      tea_id: $tea_id,
      title: $title,
      name: $name,
      pic_id: $pic_id,
      price: $price,
      introduce: $introduce,
      chose_id: $chose_id,
    }
    ''';
  }
}