import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_review/models/user.dart';
import 'package:movies_review/models/userList.dart';

import '../utils/constants.dart';

//https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]
class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _userId;
  DateTime? _expireDate;
  Timer? _logoutTimer;

  bool get isAuth {
    final isValid = _expireDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get userId {
    return isAuth ? _userId : null;
  }

  Future<void> _register(String email, String password, String urlFragment,
      Map<String, Object> data) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyAVFaHotvYTV-PfN0avpysFEt0eeLsoDYU';

    final response = await http.post(Uri.parse(url),
        body: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}));

    final body = jsonDecode(response.body);

    data['userId'] = body['localId'];
    final token = body['idToken'];

    final user = User(
        userId: body['localId'],
        name: data['name'] as String,
        nickname: data['nickname'] as String,
        email: data['email'] as String,
        password: data['password'] as String);

    addUser(user, token);
  }

  Future<void> addUser(User user, String token) async {
    final response = await http.post(
      Uri.parse('${Constants.userUrl}/${user.userId}.json?auth=$token'),
      body: jsonEncode({
        "userId": user.userId,
        "name": user.name,
        "nickname": user.nickname,
        "email": user.email,
        "password": user.password,
      }),
    );

    print(user.userId);
    print(token);
  }

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyAVFaHotvYTV-PfN0avpysFEt0eeLsoDYU';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
    );

    final body = jsonDecode(response.body);

    if (body['error'] == null) {
      _token = body['idToken'];
      _email = body['email'];
      _userId = body['localId'];
      _expireDate = DateTime.now().add(Duration(
        seconds: int.parse(body['expiresIn']),
      ));
    }

    notifyListeners();
  }

  Future<void> signUp(
      String email, String password, Map<String, Object> data) async {
    return _register(email, password, 'signUp', data);
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  void _clearLogoutTimer() {
    _logoutTimer?.cancel();
    _logoutTimer = null;
  }

  void logout() {
    _token = null;
    _email = null;
    _userId = null;
    _expireDate = null;
    _clearLogoutTimer();
    notifyListeners();
  }

  void _autoLogout() {
    _clearLogoutTimer();
    final timeToLogout = _expireDate?.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout ?? 0), logout);
  }
}
