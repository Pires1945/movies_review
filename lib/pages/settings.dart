import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_review/utils/appRoutes.dart';

import '../core/service/auth/auth_service.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final user = AuthService().currentUser;
  static const _defaultImage = 'assets/images/avatar.png';
  @override
  void initState() {
    super.initState();
  }

  Widget _showUserImage(String imageUrl) {
    ImageProvider? provider;
    final uri = Uri.parse(imageUrl);

    if (uri.path.contains(_defaultImage)) {
      provider = const AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }
    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: _showUserImage(user!.imageUrl),
                title: Text(
                  user!.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: const Text(
                  'Ver Perfil',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.MYPERFIL);
                },
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.MYREVIEWS);
                    },
                    child: const Text(
                      'Suas Avaliações',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sobre o App',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: TextButton(
              //       onPressed: () {},
              //       child: const Text(
              //         'Termos e Privacidade',
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 22,
              //             fontWeight: FontWeight.w700),
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      AuthService().logout();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sair',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
