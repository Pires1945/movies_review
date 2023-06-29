import 'dart:io';

import 'package:movies_review/core/service/auth/auth_firebase_service.dart';

import '../../models/user.dart';

abstract class AuthService {
  UserApp? get currentUser;
  Stream<UserApp?> get userChanges;

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
    return AuthFirebaseService();
  }
}
