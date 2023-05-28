import 'dart:io';

import '../../models/user.dart';
import 'auth_mock_service.dart';

abstract class AuthService {
  User? get currentUser;
  Stream<User?> get userChanges;

  Future<void> signUp(
    String name,
    String email,
    String nickName,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  factory AuthService() {
    return AuthMockService();
  }
}
