import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movies_review/models/user.dart';
import 'package:movies_review/pages/homePage.dart';
import 'package:movies_review/pages/login.dart';
import 'package:movies_review/pages/signUp.dart';
import 'package:provider/provider.dart';

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of(context);

    return user.isAuth ? HomePage() : LoginPage();
  }
}
