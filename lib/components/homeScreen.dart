import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_review/components/bannerReviewCarousel.dart';
import 'package:movies_review/models/reviewList.dart';
import 'package:movies_review/utils/appRoutes.dart';
import 'package:provider/provider.dart';

import '../models/review.dart';

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
    Provider.of<ReviewList>(context, listen: false).loadReviews();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReviewList>(context);
    final List<Review> reviewList = provider.reviews;
    List<Widget> widgets = [];

    reviewList
        .map((e) => widgets.add(BannerReviewCarousel(review: e)))
        .toList();

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
