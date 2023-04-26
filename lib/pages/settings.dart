import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movies_review/models/auth.dart';
import 'package:movies_review/utils/appRoutes.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Provider.of<Auth>(context, listen: false).loadUser().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Auth>(context);
    final user = provider.user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: isLoading
          ? Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[800],
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[350],
                          size: 36,
                        ),
                      ),
                      title: Text(
                        user!.nickname,
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
                        Navigator.of(context).pushReplacementNamed(
                            AppRoutes.USER,
                            arguments: user);
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
                            Provider.of<Auth>(context, listen: false).logout();
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.AUTHORHOME);
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
