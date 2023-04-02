import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _userData = {
    'name': '',
    'email': '',
    'password': '',
  };

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    User user = Provider.of(context, listen: false);
    await user.signUp(
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
                  decoration: const InputDecoration(labelText: 'Nome'),
                  keyboardType: TextInputType.name,
                  onSaved: (newValue) => _userData['name'] = newValue ?? '',
                  validator: (value) {
                    final name = value ?? '';

                    if (name.isEmpty) {
                      return 'Informe um nome';
                    }
                  },
                ),
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
                  controller: _passwordController,
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
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Confirmação de senha'),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    final password = value ?? '';
                    if (password != _passwordController.text) {
                      return 'As senha não conferem';
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: _submitForm, child: Text('Registrar')),
                ElevatedButton(onPressed: () {}, child: Text('Cancelar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
