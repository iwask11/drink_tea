
class UserAddress {
  late String address_id;
  late String address_name;
  late String address_text;


  UserAddress({
    required this.address_id,
    required this.address_name,
    required this.address_text,
  });

  UserAddress.fromJson(dynamic json){
    address_id = json['address_id'];
    address_name = json['address_name'];
    address_text = json['address_text'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_id'] = address_id;
    map['address_name'] = address_name;
    map['address_text'] = address_text;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'address_id': address_id,
      'address_name': address_name,
      'address_text': address_text,
    };
  }

  @override
  String toString() {
    return '''
    UserAddress{
      address_id: $address_id,
      address_name: $address_name,
      address_text: $address_text,
    }
    ''';
  }
}