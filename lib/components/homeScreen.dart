import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_review/core/service/review/reviewService.dart';
import 'package:movies_review/utils/appRoutes.dart';

import '../core/models/review.dart';
import 'bannerReviewCarousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
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
        Column(
          children: [
            Container(
              width: double.infinity,
              color: Color.fromARGB(255, 20, 20, 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
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
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              )),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.SETTINGS);
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
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cíticas dos usuários',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(3),
                  child: StreamBuilder<List<Review>>(
                    stream: ReviewService().reviewStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final reviewList = snapshot.data;
                        List<Widget> widgets = [];
                        reviewList!
                            .map((e) =>
                                widgets.add(BannerReviewCarousel(review: e)))
                            .toList();
                        return CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                            viewportFraction: 0.46,
                          ),
                          items: widgets.map((e) {
                            return Builder(builder: (BuildContext context) {
                              return e;
                            });
                          }).toList(),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Filmes com melhor avaliação',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
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
