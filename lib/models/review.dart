import 'package:flutter/material.dart';
import 'package:movies_review/models/movie.dart';

class Review extends ChangeNotifier {
  String id;
  String movieTitle;
  int movieId;
  String review;
  int avaliation;
  DateTime date;

  Review({
    required this.id,
    required this.movieTitle,
    required this.movieId,
    required this.review,
    required this.avaliation,
    required this.date,
  });
}
