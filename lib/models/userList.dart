import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies_review/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:movies_review/utils/constants.dart';

class UserList extends ChangeNotifier {
  // final String _token;
  // final String _userId;

  // UserList([
  //   this._token = '',
  //   this._userId = '',
  // ]);

  Future<void> saveUser(
      Map<String, Object> data, String token, String userId) async {
    print(data.toString());
    print(token);

    final user = User(
      userId: userId,
      name: data['name'] as String,
      nickname: data['nickname'] as String,
      email: data['email'] as String,
      password: data['password'] as String,
    );

    addUser(user, userId, token);
  }

  Future<void> addUser(User user, String userId, String token) async {
    final response = await http.post(
      Uri.parse('${Constants.userUrl}/$userId.json?auth=$token'),
      body: jsonEncode({
        "userId": user.userId,
        "name": user.name,
        "nickname": user.nickname,
        "email": user.email,
        "password": user.password,
      }),
    );

    print(userId);
    print(token);
  }
}
