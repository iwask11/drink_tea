
class TeaShowChoseText {
  late String chose_id;
  late String cap;
  late String ice;
  late String sweet;
  late String material;


  TeaShowChoseText({
    required this.chose_id,
    required this.ice,
    required this.cap,
    required this.sweet,
    required this.material
  });

  TeaShowChoseText.fromJson(dynamic json){
    chose_id = json['chose_id'];
    ice = json['ice'];
    cap = json['cap'];
    sweet = json['sweet'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chose_id'] = chose_id;
    map['ice'] = ice;
    map['cap'] = cap;
    map['sweet'] = sweet;
    map['material'] = material;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'chose_id': chose_id,
      'ice': ice,
      'cap': cap,
      'sweet': sweet,
      'material': material,
    };
  }

  @override
  String toString() {
    return '''
    TeaShowChoseText{
      chose_id: $chose_id,
      ice: $ice,
      cap: $cap,
      sweet: $sweet,
      material: $material,
    }
    ''';
  }
}