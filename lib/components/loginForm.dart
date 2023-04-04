import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../utils/appRoutes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _userData = {
    'email': '',
    'password': '',
  };

  bool isLogin = true;

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
    final deviceSize = MediaQuery.of(context).size;
    return Flexible(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 15,
        child: Container(
          height: isLogin ? 310 : 400,
          width: deviceSize.width * 0.8,
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => _userData['email'] = newValue ?? '',
                  validator: (value) {
                    final email = value ?? '';

                    if (email.trim().isEmpty || !email.contains('@')) {
                      return 'Informe um email válido';
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
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
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text('Login'),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      ),
                      backgroundColor: Color.fromARGB(255, 13, 75, 126)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = false;
                      });
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
