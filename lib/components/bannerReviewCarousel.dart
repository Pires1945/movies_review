import 'package:flutter/material.dart';
import '../models/review.dart';

class BannerReviewCarousel extends StatelessWidget {
  final Review review;
  const BannerReviewCarousel({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: GestureDetector(
      child: Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 70, 70, 70),
              Color.fromARGB(255, 12, 12, 12),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                review.movieTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                review.review,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    ));
  }
}
