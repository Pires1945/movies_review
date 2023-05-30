import 'dart:async';
import 'dart:math';

import 'package:movies_review/core/models/movie.dart';
import 'package:movies_review/core/models/review.dart';
import 'package:movies_review/core/models/user.dart';
import 'package:movies_review/core/service/review/reviewService.dart';

class ReviewMockService implements ReviewService {
  static final List<Review> _reviews = [
    Review(
      id: '123',
      userId: '321',
      movieTitle: 'Teste Filme',
      movieId: 456,
      review: 'Testando a review',
      avaliation: 5,
      date: DateTime.now(),
    ),
    Review(
      id: '321',
      userId: '123',
      movieTitle: 'Teste Filme 2',
      movieId: 654,
      review:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at ante a eros mollis ultricies quis vitae lectus. Suspendisse potenti.',
      avaliation: 4,
      date: DateTime.now(),
    ),
    Review(
      id: '321',
      userId: '123',
      movieTitle: 'Teste Filme 2',
      movieId: 654,
      review:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at ante a eros mollis ultricies quis vitae lectus. Suspendisse potenti.',
      avaliation: 4,
      date: DateTime.now(),
    ),
    Review(
      id: '321',
      userId: '123',
      movieTitle: 'Teste Filme 2',
      movieId: 654,
      review:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at ante a eros mollis ultricies quis vitae lectus. Suspendisse potenti.',
      avaliation: 4,
      date: DateTime.now(),
    ),
    Review(
      id: '321',
      userId: '123',
      movieTitle: 'Teste Filme 2',
      movieId: 654,
      review:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at ante a eros mollis ultricies quis vitae lectus. Suspendisse potenti.',
      avaliation: 4,
      date: DateTime.now(),
    ),
    Review(
      id: '321',
      userId: '123',
      movieTitle: 'Teste Filme 2',
      movieId: 654,
      review:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at ante a eros mollis ultricies quis vitae lectus. Suspendisse potenti.',
      avaliation: 4,
      date: DateTime.now(),
    ),
    Review(
      id: '321',
      userId: '123',
      movieTitle: 'Teste Filme 2',
      movieId: 654,
      review:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at ante a eros mollis ultricies quis vitae lectus. Suspendisse potenti.',
      avaliation: 4,
      date: DateTime.now(),
    ),
  ];
  static MultiStreamController<List<Review>>? _controller;

  static final _reviewStream = Stream<List<Review>>.multi((controller) {
    _controller = controller;
    controller.add(_reviews);
  });

  @override
  Stream<List<Review>> reviewStream() {
    return _reviewStream;
  }

  @override
  Future<Review> save(String movieTitle, String reviewText, int avaliation,
      DateTime date, User user, Movie movie) async {
    final review = Review(
        id: Random().nextDouble().toString(),
        userId: user.userId,
        movieTitle: movie.title,
        movieId: movie.id,
        review: reviewText,
        avaliation: avaliation,
        date: date);

    _reviews.add(review);
    _controller?.add(_reviews.reversed.toList());
    return review;
  }
}
