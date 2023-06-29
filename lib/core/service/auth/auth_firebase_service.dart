import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
        email: email, password: password);

    if (credential.user == null) return;

    final imageName = '${credential.user!.uid}.jpg';
    final imageUrl = await _uploadUserImage(image, imageName);

    await credential.user?.updateDisplayName(name);
    await credential.user?.updatePhotoURL(imageUrl);

    await _saveUserApp(_toUserApp(credential.user!, imageUrl));
  }

  Future<String?> _uploadUserImage(File? image, String imageName) async {
    if (image == null) return null;

    final storage = FirebaseStorage.instance;
    final imageRef = storage.ref().child('user_images').child(imageName);

    await imageRef.putFile(image).whenComplete(() {});
    return await imageRef.getDownloadURL();
  }

  Future<void> _saveUserApp(UserApp user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(user.userId);

    return docRef.set({
      'name': user.name,
      'email': user.email,
      'imageUrl': user.imageUrl,
    });
  }

  static UserApp _toUserApp(User user, [String? imageUrl]) {
    return UserApp(
      userId: user.uid,
      name: user.displayName ?? user.email!.split('@')[0],
      nickname: user.displayName ?? '',
      email: user.email!,
      password: user.email!,
      imageUrl: imageUrl ?? user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
