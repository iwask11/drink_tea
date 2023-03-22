
class Pictures {
  late String pic_id;
  late String pic_name;
  late String pic_classify;
  late String pic_url;


  Pictures({
    required this.pic_id,
    required this.pic_name,
    required this.pic_classify,
    required this.pic_url,
  });

  Pictures.fromJson(dynamic json){
    pic_id = json['pic_id'];
    pic_name = json['pic_name'];
    pic_classify = json['pic_classify'];
    pic_url = json['pic_url'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pic_id'] = pic_id;
    map['pic_name'] = pic_name;
    map['pic_classify'] = pic_classify;
    map['pic_url'] = pic_url;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'pic_id': pic_id,
      'pic_name': pic_name,
      'pic_classify': pic_classify,
      'pic_url': pic_url,
    };
  }

  @override
  String toString() {
    return '''
    Pictures{
      pic_id: $pic_id,
      pic_name: $pic_name,
      pic_classify: $pic_classify,
      pic_url: $pic_url,
    }
    ''';
  }
}