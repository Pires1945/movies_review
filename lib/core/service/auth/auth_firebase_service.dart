import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';
import 'auth_service.dart';

class AuthFirebaseService implements AuthService {
  static UserApp? _currentUser;
  static final _userStream = Stream<UserApp?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChanges) {
      _currentUser = user == null ? null : _toUserApp(user);
      controller.add(_currentUser);
    }
  });

  @override
  UserApp? get currentUser => _currentUser;

  @override
  Stream<UserApp?> get userChanges => _userStream;

  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signUp(
    String name,
    String email,
    String nickName,
    String password,
    File? image,
  ) async {
    final auth = FirebaseAuth.instance;
    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) return;

    credential.user!.updateDisplayName(name);
    //credential.user!.updatePhotoURL(photoURL);
  }

  static UserApp _toUserApp(User user) {
    return UserApp(
      userId: user.uid,
      name: user.displayName ?? user.email!.split('@')[0],
      nickname: user.displayName ?? '',
      email: user.email!,
      password: user.email!,
      imageUrl: user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
