import 'dart:convert';

class User {
  late String email;
  late String username;
  late String password;

  User({required this.email, required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'username': username, 'password': password};
  }

  String toJson() {
    Map<String, dynamic> userMap = toMap();
    return jsonEncode(userMap);
  }
}
