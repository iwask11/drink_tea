
class OrdersItems {
  late String orders_items_id;
  late String orders_items_add_id;
  late String tea_id;
  late String number;
  late String allprice;
  late String state;


  OrdersItems({
    required this.orders_items_id,
    required this.orders_items_add_id,
    required this.tea_id,
    required this.number,
    required this.allprice,
    required this.state,
  });

  OrdersItems.fromJson(dynamic json){
    orders_items_id = json['orders_items_id'];
    orders_items_add_id = json['orders_items_add_id'];
    tea_id = json['tea_id'];
    number = json['number'];
    allprice = json['allprice'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orders_items_id'] = orders_items_id;
    map['orders_items_add_id'] = orders_items_add_id;
    map['tea_id'] = tea_id;
    map['number'] = number;
    map['allprice'] = allprice;
    map['state'] = state;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'orders_items_id': orders_items_id,
      'orders_items_add_id': orders_items_add_id,
      'tea_id': tea_id,
      'number': number,
      'allprice': allprice,
      'state': state,
    };
  }

  @override
  String toString() {
    return '''
    OrdersItems{
      orders_items_id: $orders_items_id,
      orders_items_add_id: $orders_items_add_id,
      tea_id: $tea_id,
      number: $number,
      allprice: $allprice,
      state: $state,
    }
    ''';
  }
}