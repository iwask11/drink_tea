
class OrdersItemsAdd {
  late String orders_items_add_id;
  late String cap;
  late String ice;
  late String sweet;
  late String material;


  OrdersItemsAdd({
    required this.orders_items_add_id,
    required this.cap,
    required this.ice,
    required this.sweet,
    required this.material,
  });

  OrdersItemsAdd.fromJson(dynamic json){
    orders_items_add_id = json['orders_items_add_id'];
    cap = json['cap'];
    ice = json['ice'];
    sweet = json['sweet'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orders_items_add_id'] = orders_items_add_id;
    map['cap'] = cap;
    map['ice'] = ice;
    map['sweet'] = sweet;
    map['material'] = material;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'orders_items_add_id': orders_items_add_id,
      'cap': cap,
      'ice': ice,
      'sweet': sweet,
      'material': material,
    };
  }

  @override
  String toString() {
    return '''
    OrdersItemsAdd{
      orders_items_add_id: $orders_items_add_id,
      cap: $cap,
      ice: $ice,
      sweet: $sweet,
      material: $material,
    }
    ''';
  }
}