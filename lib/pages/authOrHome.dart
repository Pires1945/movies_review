import 'package:flutter/material.dart';
import 'package:movies_review/pages/homePage.dart';
import 'package:movies_review/pages/loadingPage.dart';
import 'package:movies_review/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import '../core/models/user.dart';
import '../core/service/auth/auth_service.dart';

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoagingPage();
        } else {
          return StreamBuilder<User?>(
            stream: AuthService().userChanges,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoagingPage();
              } else {
                return snapshot.hasData ? HomePage() : LoginPage();
              }
            },
          );
        }
      },
    );
  }
}
