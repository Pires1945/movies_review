import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_review/core/models/review.dart';
import 'package:movies_review/core/service/review/reviewService.dart';

class ReviewFirebaseService implements ReviewService {
  @override
  Stream<List<Review>> reviewStream() {
    final store = FirebaseFirestore.instance;
    final snapshots = store
        .collection('reviews')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .snapshots();

    return Stream<List<Review>>.multi((controller) {
      snapshots.listen((snapshot) {
        List<Review> list = snapshot.docs.map((e) {
          return e.data();
        }).toList();
        controller.add(list);
      });
    });
  }

  @override
  Future<Review> saveReview(Map<String, Object> data) async {
    final store = FirebaseFirestore.instance;
    final review = Review(
      id: '',
      userId: data['userId'] as String,
      userImageUrl: data['userImage'] as String,
      movieTitle: data['movieTitle'] as String,
      movieId: data['movieId'] as int,
      review: data['review'] as String,
      avaliation: data['avaliation'] as int,
      date: DateTime.now(),
    );

    final docRef = await store
        .collection('reviews')
        .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
        .add(review);

    final doc = await docRef.get();
    return doc.data()!;
  }

  CollectionReference review = FirebaseFirestore.instance.collection('reviews');

  @override
  Future<void> updateReview(Map<String, Object> data) {
    return review
        .doc(data['id'] as String)
        .update({'review': data['review'], 'avaliation': data['avaliation']})
        .then((value) => print('Review Update'))
        .catchError((error) => print('${error}'));
  }

  Map<String, dynamic> _toFirestore(
    Review review,
    SetOptions? optrions,
  ) {
    return {
      'userId': review.userId,
      'userImage': review.userImageUrl,
      'movieTitle': review.movieTitle,
      'movieId': review.movieId,
      'review': review.review,
      'avaliation': review.avaliation,
      'date': review.date.toIso8601String(),
    };
  }

  Review _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    return Review(
      id: doc.id,
      userId: doc['userId'],
      userImageUrl: doc['userImage'],
      movieTitle: doc['movieTitle'],
      movieId: doc['movieId'],
      review: doc['review'],
      avaliation: doc['avaliation'],
      date: DateTime.parse(doc['date']),
    );
  }
}
