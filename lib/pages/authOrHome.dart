import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movies_review/models/auth.dart';
import 'package:movies_review/pages/homePage.dart';
import 'package:movies_review/pages/login.dart';
import 'package:provider/provider.dart';

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return auth.isAuth ? HomePage() : LoginPage();
  }
}
