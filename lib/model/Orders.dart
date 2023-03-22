
class Orders{
  late String orders_id;
  late String orders_items_id;
  late String user_id;
  late String user_address_id;
  late String price;
  late String start_time;
  late String end_time;
  late String state;


  Orders({
    required this.orders_id,
    required this.orders_items_id,
    required this.user_id,
    required this.user_address_id,
    required this.price,
    required this.start_time,
    required this.end_time,
    required this.state,
  });

  Orders.fromJson(dynamic json){
    orders_id = json['orders_id'];
    orders_items_id = json['orders_items_id'];
    user_id = json['user_id'];
    user_address_id = json['user_address_id'];
    price = json['price'];
    start_time = json['start_time'];
    end_time = json['end_time'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orders_id'] = orders_id;
    map['orders_items_id'] = orders_items_id;
    map['user_id'] = user_id;
    map['user_address_id'] = user_address_id;
    map['price'] = price;
    map['start_time'] = start_time;
    map['end_time'] = end_time;
    map['state'] = state;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'orders_id': orders_id,
      'orders_items_id': orders_items_id,
      'user_id': user_id,
      'user_address_id': user_address_id,
      'price': price,
      'start_time': start_time,
      'end_time': end_time,
      'state': state,
    };
  }

  @override
  String toString() {
    return '''
    Orders{
      orders_id: $orders_id,
      orders_items_id: $orders_items_id,
      user_id: $user_id,
      user_address_id: $user_address_id,
      price: $price,
      start_time: $start_time,
      end_time: $end_time,
      state: $state,
    }
    ''';
  }
}