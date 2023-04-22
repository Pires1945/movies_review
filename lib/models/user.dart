import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String? userId;
  String name;
  String nickname;
  String email;
  String password;

  User({
    required this.userId,
    required this.name,
    required this.nickname,
    required this.email,
    required this.password,
  });
}
