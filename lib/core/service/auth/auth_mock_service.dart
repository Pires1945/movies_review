import 'dart:async';
import 'dart:io';
import 'dart:math';

import '../../models/user.dart';
import 'auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = User(
    userId: '123',
    name: 'Teste',
    email: 'teste@gmail.com',
    password: '123456',
    nickname: 'testinho',
    imageUrl: 'assets/images/avatar.png',
  );

  static Map<String, User> _users = {_defaultUser.email: _defaultUser};
  static User? _currentUser;
  static MultiStreamController<User?>? _controller;
  static final _userStream = Stream<User?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  User? get currentUser => _currentUser;

  @override
  Stream<User?> get userChanges => _userStream;

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
    final newUser = User(
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

  static void _updateUser(User? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
