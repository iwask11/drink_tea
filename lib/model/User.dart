
class User {
  late String user_id;
  late String address_id;
  late String username;
  late String phone;
  late String password;


  User({
    required this.user_id,
    required this.address_id,
    required this.username,
    required this.phone,
    required this.password,
  });

  User.fromJson(dynamic json){
    user_id = json['user_id'];
    address_id = json['address_id'];
    username = json['username'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = user_id;
    map['address_id'] = address_id;
    map['username'] = username;
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'address_id': address_id,
      'username': username,
      'phone': phone,
      'password': password,
    };
  }

  @override
  String toString() {
    return '''
    User{
      user_id: $user_id,
      address_id: $address_id,
      username: $username,
      phone: $phone,
      password: $password,
    }
    ''';
  }
}