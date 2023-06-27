import 'package:flutter/material.dart';

class UserApp with ChangeNotifier {
  String userId;
  String name;
  String nickname;
  String email;
  String password;
  String imageUrl;

  UserApp(
      {required this.userId,
      required this.name,
      required this.nickname,
      required this.email,
      required this.password,
      required this.imageUrl});
}
