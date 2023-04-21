import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movies_review/models/movie.dart';
import 'package:movies_review/models/review.dart';

import '../utils/constants.dart';

class ReviewList extends ChangeNotifier {
  final String _token;
  final String _userId;
  List<Review> _reviews = [];
  List<Review> get reviews => [..._reviews];

  ReviewList([
    this._token = '',
    this._userId = '',
    this._reviews = const [],
  ]);

  Future<void> saveReview(Map<String, Object> data) async {
    bool hasId = data['id'] != null;

    final review = Review(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      userId: _userId,
      movieTitle: data['movieTitle'] as String,
      movieId: data['movieId'] as int,
      review: data['review'] as String,
      avaliation: data['avaliation'] as int,
      date: data['date'] as DateTime,
    );

    addReview(review);
  }

  Future<void> addReview(Review review) async {
    final response = await http.post(
      Uri.parse('${Constants.reviewUrl}.json?auth=$_token'),
      body: jsonEncode({
        "userId": review.userId,
        "movieTitle": review.movieTitle,
        "movieId": review.movieId,
        "review": review.review,
        "avaliation": review.avaliation,
        "date": review.date.toString(),
      }),
    );

    // final id = jsonDecode(response.body)['name'];
    // _reviews.add(Review(
    //   id: id,
    //   movie: review.movie,
    //   movieId: review.movieId,
    //   review: review.review,
    //   avaliation: review.avaliation,
    //   date: review.date,
    // ));
    // notifyListeners();
  }

  Future<void> loadReviews() async {
    _reviews.clear();
    final response =
        await http.get(Uri.parse('${Constants.reviewUrl}.json?auth=$_token'));
    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);

    //print(response.body);

    data.forEach((key, value) {
      _reviews.add(
        Review(
          id: key,
          userId: _userId,
          movieTitle: value['movieTitle'],
          movieId: value['movieId'],
          review: value['review'],
          avaliation: value['avaliation'],
          date: DateTime.parse(value['date']),
        ),
      );
    });
    notifyListeners();
  }
}
