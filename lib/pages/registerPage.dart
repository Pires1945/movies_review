import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPageForm extends StatefulWidget {
  const RegisterPageForm({super.key});

  @override
  State<RegisterPageForm> createState() => _RegisterPageFormState();
}

class _RegisterPageFormState extends State<RegisterPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final Map<String, String> _registerData = {
    'name': '',
    'nickName': '',
    'email': '',
    'password': '',
  };

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
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(144, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Nome',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                              keyboardType: TextInputType.name,
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              onSaved: (newValue) =>
                                  _registerData['name'] = newValue ?? '',
                              validator: (value) {
                                final name = value ?? '';
                                if (name.isEmpty) {
                                  return 'Informe seu nome';
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(144, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Como quer ser chamado ?',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                              keyboardType: TextInputType.name,
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              onSaved: (newValue) =>
                                  _registerData['nickName'] = newValue ?? '',
                              validator: (value) {
                                final name = value ?? '';
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(144, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                              keyboardType: TextInputType.text,
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              onSaved: (newValue) =>
                                  _registerData['email'] = newValue ?? '',
                              validator: (value) {
                                final email = value ?? '';
                                if (email.trim().isEmpty ||
                                    !email.contains('@')) {
                                  return 'Informe um email válido';
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(144, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            child: TextFormField(
                              controller: _passwordController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Senha',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                              keyboardType: TextInputType.name,
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              validator: (value) {
                                final password = value ?? '';
                                if (password.isEmpty || password.length < 5) {
                                  return 'Informe uma senha maior que 5 caracteres';
                                } else {
                                  null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(144, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: 'Confirme sua senha',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                              keyboardType: TextInputType.name,
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                              onSaved: (newValue) =>
                                  _registerData['password'] = newValue ?? '',
                              validator: (value) {
                                final password = value ?? '';
                                if (password != _passwordController.text) {
                                  return 'As senhas não conferem';
                                } else {
                                  return null;
                                }
                              },
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
                        color: Color.fromARGB(255, 9, 85, 99),
                      ),
                      child: TextButton(
                        onPressed: () {},
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
                        onPressed: () {},
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
