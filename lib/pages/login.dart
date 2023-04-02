import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movies_review/utils/appRoutes.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _userData = {
    'email': '',
    'password': '',
  };

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    User user = Provider.of(context, listen: false);
    await user.login(
      _userData['email']!,
      _userData['password']!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bem vindo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => _userData['email'] = newValue ?? '',
                  validator: (value) {
                    final email = value ?? '';

                    if (email.trim().isEmpty || !email.contains('@')) {
                      return 'Informe um email válido';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  onSaved: (newValue) => _userData['password'] = newValue ?? '',
                  validator: (value) {
                    final password = value ?? '';
                    if (password.isEmpty || password.length < 5) {
                      return 'Informe um senha maior que 5 caracteres';
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(onPressed: _submitForm, child: Text('Login')),
                ElevatedButton(onPressed: () {}, child: Text('Cancelar')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.SIGNUP);
                    },
                    child: Text('Registrar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
