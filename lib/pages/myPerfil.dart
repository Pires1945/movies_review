import 'dart:io';

import 'package:flutter/material.dart';
import '../components/userImagePicker.dart';
import '../core/models/authForm.dart';
import '../core/service/auth/auth_service.dart';

class MyPerfil extends StatefulWidget {
  const MyPerfil({super.key});

  @override
  State<MyPerfil> createState() => _MyPerfilState();
}

class _MyPerfilState extends State<MyPerfil> {
  @override
  void initState() {
    super.initState();
  }

  final user = AuthService().currentUser;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool updateImage = false;

  final _formData = AuthFormData();

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  void _updateImage() {
    updateImage = true;
    initState();
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
                      child: Column(
                        children: [
                          updateImage
                              ? UserImagePicker(onImagePick: _handleImagePick)
                              : Container(
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.grey,
                                    backgroundImage:
                                        NetworkImage(user!.imageUrl),
                                  ),
                                ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.3),
                            child: TextButton(
                                onPressed: _updateImage,
                                child: const Text(
                                  'Trocar Foto',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                          ),
                          Container(
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: user!.name,
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(111, 255, 255, 255),
                                    fontSize: 14),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(80, 255, 255, 255))),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(144, 255, 255, 255)),
                                ),
                              ),
                              key: const ValueKey('name'),
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
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: user!.nickname,
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              80, 255, 255, 255))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              144, 255, 255, 255)))),
                              keyboardType: TextInputType.name,
                              key: const ValueKey('nickName'),
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 45,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: user!.email,
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(111, 255, 255, 255),
                                      fontSize: 14),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              80, 255, 255, 255))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              144, 255, 255, 255)))),
                              keyboardType: TextInputType.text,
                              key: const ValueKey('email'),
                              cursorColor:
                                  const Color.fromARGB(255, 221, 221, 221),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 45,
                            child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: '*******',
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
                              key: const ValueKey('password'),
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
                                  labelText: '*******',
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
                        onPressed: () {},
                        child: const Text(
                          'Atualizar',
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
    ;
  }
}
