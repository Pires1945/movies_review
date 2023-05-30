import 'package:flutter/material.dart';

import '../core/models/review.dart';

class ReviewItem extends StatelessWidget {
  final Review review;
  const ReviewItem(this.review, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3, bottom: 3),
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            review.movieTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            review.review,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        trailing: Text(
          '${review.avaliation.toString()} Estrelas',
          style: const TextStyle(color: Colors.yellow),
        ),
      ),
    );
  }
}
