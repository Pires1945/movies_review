import 'dart:async';
import 'dart:math';
import 'package:movies_review/core/models/review.dart';
import 'package:movies_review/core/service/review/reviewService.dart';

class ReviewMockService implements ReviewService {
  static final List<Review> _reviews = [
    // Review(
    //     id: '123',
    //     userId: '321',
    //     movieTitle: 'teste',
    //     movieId: 100,
    //     review: 'fjdlksafjdskljafjhdskafhdsjakcnacioudnceu',
    //     avaliation: 5,
    //     date: DateTime.now()),
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
  Future<Review> saveReview(Map<String, Object> data) async {
    print('teste');
    bool hasId = data['id'] != null;
    final newReview = Review(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      userId: data['userId'] as String,
      movieTitle: data['movieTitle'] as String,
      movieId: data['movieId'] as int,
      review: data['review'] as String,
      avaliation: data['avaliation'] as int,
      date: data['date'] as DateTime,
    );

    _reviews.add(newReview);
    _controller?.add(_reviews.reversed.toList());
    return newReview;
  }
}
