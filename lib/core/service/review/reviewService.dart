import 'package:movies_review/core/models/review.dart';
import 'package:movies_review/core/service/review/reviewMockService.dart';

abstract class ReviewService {
  Stream<List<Review>> reviewStream();

  Future<Review> saveReview(Map<String, Object> data);

  factory ReviewService() {
    return ReviewMockService();
  }
}
