import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]
class User with ChangeNotifier {
  String? _token;
  String? _email;
  String? _userId;

  bool get isAuth {
    return _token != null;
  }

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyAVFaHotvYTV-PfN0avpysFEt0eeLsoDYU';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] == null) {
      _token = body['idToken'];
    }

    print(_token);
    print(isAuth);
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
