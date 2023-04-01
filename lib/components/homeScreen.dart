import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movies_review/components/widgetProvisorio.dart';
import 'package:movies_review/utils/appRoutes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgets = const [
    Plano(
      title: 'Usuário 1',
      description:
          'Mussum Ipsum, cacilds vidis litro abertis. Detraxit consequat et quo num tendi nada.Quem num gosta di mim que vai caçá sua turmis!Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.',
    ),
    Plano(
      title: 'Usuário 2',
      description:
          'Mussum Ipsum, cacilds vidis litro abertis. Detraxit consequat et quo num tendi nada.Quem num gosta di mim que vai caçá sua turmis!Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.',
    ),
    Plano(
      title: 'Usuário 3',
      description:
          'Mussum Ipsum, cacilds vidis litro abertis. Detraxit consequat et quo num tendi nada.Quem num gosta di mim que vai caçá sua turmis!Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.',
    ),
    Plano(
      title: 'Usuário 4',
      description:
          'Mussum Ipsum, cacilds vidis litro abertis. Detraxit consequat et quo num tendi nada.Quem num gosta di mim que vai caçá sua turmis!Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.',
    ),
    Plano(
      title: 'Usuário 5',
      description:
          'Mussum Ipsum, cacilds vidis litro abertis. Detraxit consequat et quo num tendi nada.Quem num gosta di mim que vai caçá sua turmis!Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'images/samurais.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Color.fromARGB(112, 54, 54, 54),
        ),
        Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Color.fromARGB(255, 20, 20, 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Bem Vindo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Color.fromARGB(78, 158, 158, 158),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cíticas dos usuários',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.all(3),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      viewportFraction: 0.47,
                    ),
                    items: widgets.map((e) {
                      return Builder(builder: (BuildContext context) {
                        return e;
                      });
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
