import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_review/components/userImagePicker.dart';
import '../core/models/authForm.dart';
import '../core/service/auth/auth_service.dart';

class RegisterPageForm extends StatefulWidget {
  const RegisterPageForm({super.key});

  @override
  State<RegisterPageForm> createState() => _RegisterPageFormState();
}

class _RegisterPageFormState extends State<RegisterPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final bool update = false;

  final _formData = AuthFormData();

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: (Text(msg)),
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    if (_formData.image == null) {
      return _showError('Selecione uma imagem');
    }

    _formKey.currentState?.save();

    try {
      if (!mounted) return;
      await AuthService().signUp(
        _formData.name,
        _formData.email,
        _formData.nickname,
        _formData.password,
        _formData.image,
      );
    } catch (error) {
      print(error.toString());
    }

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Cadastro feito com sucesso!'),
      duration: Duration(seconds: 2),
    ));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 9, 85, 99),
                  Color.fromARGB(255, 32, 32, 32),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Seus dados: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          UserImagePicker(
                              onImagePick: _handleImagePick, update: update),
                          Container(
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                labelText: 'Nome',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(111, 255, 255, 255),
                                    fontSize: 14),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(80, 255, 255, 255))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(144, 255, 255, 255)),
                                ),
                              ),
                              key: ValueKey('name'),
                              keyboardType: TextInputType.name,
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              validator: (value) {
                                final name = value ?? '';
                                if (name.isEmpty) {
                                  return 'Informe seu nome';
                                }
                                return null;
                              },
                              onChanged: (value) => _formData.name = value,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Como quer ser chamado ?',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              80, 255, 255, 255))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              144, 255, 255, 255)))),
                              keyboardType: TextInputType.name,
                              key: ValueKey('nickName'),
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              onChanged: (value) => _formData.nickname = value,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              80, 255, 255, 255))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              144, 255, 255, 255)))),
                              keyboardType: TextInputType.text,
                              key: ValueKey('email'),
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              validator: (value) {
                                final email = value ?? '';
                                if (email.trim().isEmpty ||
                                    !email.contains('@')) {
                                  return 'Informe um email válido';
                                }
                                return null;
                              },
                              onChanged: (value) => _formData.email = value,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 45,
                            child: TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Senha',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              80, 255, 255, 255))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              144, 255, 255, 255)))),
                              keyboardType: TextInputType.name,
                              key: ValueKey('password'),
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              validator: (value) {
                                final password = value ?? '';
                                if (password.isEmpty || password.length < 5) {
                                  return 'Informe uma senha maior que 5 caracteres';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 45,
                            child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Confirme sua senha',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              80, 255, 255, 255))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              144, 255, 255, 255)))),
                              keyboardType: TextInputType.name,
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              validator: (value) {
                                final password = value ?? '';
                                if (password != _passwordController.text) {
                                  return 'As senhas não conferem';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) => _formData.password = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 9, 85, 99),
                      ),
                      child: TextButton(
                        onPressed: _submit,
                        child: const Text(
                          'Registrar',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: const Color.fromARGB(144, 255, 255, 255))),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
