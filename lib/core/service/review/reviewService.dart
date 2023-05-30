import 'package:movies_review/core/models/movie.dart';
import 'package:movies_review/core/models/review.dart';
import 'package:movies_review/core/service/review/reviewMockService.dart';

import '../../models/user.dart';

abstract class ReviewService {
  Stream<List<Review>> reviewStream();
  Future<Review> save(String movieTitle, String review, int avaliation,
      DateTime date, User user, Movie movie);

  factory ReviewService() {
    return ReviewMockService();
  }
}
