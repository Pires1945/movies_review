import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movies_review/utils/appRoutes.dart';
import '../core/models/review.dart';

class ReviewItem extends StatelessWidget {
  final Review review;
  ReviewItem(this.review, {super.key});
  static const _defaultImage = 'assets/images/avatar.png';

  Widget _showReviewImage(String imageUrl) {
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushReplacementNamed(AppRoutes.UPDATEREVIEW, arguments: review);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 3, bottom: 3),
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: CircleAvatar(
            child: _showReviewImage(review.userImageUrl),
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
      ),
    );
  }
}
