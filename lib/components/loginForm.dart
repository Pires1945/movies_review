import 'package:flutter/material.dart';
import 'package:movies_review/utils/appRoutes.dart';

import '../core/models/authForm.dart';
import '../core/service/auth/auth_service.dart';

enum AuthMode {
  sigUp,
  Login,
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  AuthMode _authMode = AuthMode.Login;
  final _formData = AuthFormData();

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSigUp() => _authMode == AuthMode.sigUp;

  void _switchLoginMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.sigUp;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    try {
      await AuthService().login(
        _formData.email,
        _formData.password,
      );
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nome do App',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Divider(),
            Card(
              color: const Color.fromARGB(255, 221, 220, 220),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 15,
              child: Container(
                height: _isLogin() ? 280 : 320,
                width: deviceSize.width * 0.8,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 110, 110, 110)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 110, 110, 110))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 110, 110, 110)),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => _formData.email = value,
                          validator: (value) {
                            final email = value ?? '';

                            if (email.trim().isEmpty || !email.contains('@')) {
                              return 'Informe um email válido';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: _passwordController,
                          cursorColor: Colors.grey,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 110, 110, 110)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 110, 110, 110))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 110, 110, 110)),
                            ),
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          onChanged: (value) => _formData.password = value,
                          validator: (value) {
                            final password = value ?? '';
                            if (password.isEmpty || password.length < 5) {
                              return 'Informe um senha maior que 5 caracteres';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (_isSigUp())
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Confirmação de senha',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            onSaved: (newValue) =>
                                _authData['password'] = newValue ?? '',
                            validator: (value) {
                              final password = value ?? '';
                              if (password != _passwordController.text) {
                                return 'As senha não conferem!';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 13, 75, 126)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.REGISTERFORM);
                        },
                        child: Text(
                            _isLogin() ? 'Criar conta' : 'Já tenho uma conta'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
