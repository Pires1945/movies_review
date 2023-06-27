import 'dart:async';
import 'dart:io';
import 'dart:math';

import '../../models/user.dart';
import 'auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = UserApp(
    userId: '123',
    name: 'Teste',
    email: 'teste@gmail.com',
    password: '123456',
    nickname: 'testinho',
    imageUrl: 'assets/images/avatar.png',
  );

  static Map<String, UserApp> _users = {_defaultUser.email: _defaultUser};
  static UserApp? _currentUser;
  static MultiStreamController<UserApp?>? _controller;
  static final _userStream = Stream<UserApp?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  UserApp? get currentUser => _currentUser;

  @override
  Stream<UserApp?> get userChanges => _userStream;

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signUp(String name, String email, String nickName,
      String password, File? image) async {
    final newUser = UserApp(
      userId: Random().nextDouble().toString(),
      name: name,
      email: email,
      password: password,
      nickname: nickName,
      imageUrl: image?.path ?? 'assets/images/avatar.png',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  static void _updateUser(UserApp? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
