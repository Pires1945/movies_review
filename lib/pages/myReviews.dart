import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_review/core/models/review.dart';
import 'package:movies_review/core/service/auth/auth_service.dart';
import 'package:movies_review/core/service/review/reviewService.dart';

import '../components/reviewItem.dart';

class MyReviews extends StatefulWidget {
  const MyReviews({super.key});

  @override
  State<MyReviews> createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {
  final user = AuthService().currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 9, 85, 99),
              Color.fromARGB(255, 32, 32, 32),
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder<List<Review>>(
          stream: ReviewService().reviewStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Sem dados'),
              );
            } else {
              final reviews = snapshot.data!
                  .where((element) => element.userId == user!.userId)
                  .toList();
              return ListView.builder(
                itemCount: reviews.length,
                padding: const EdgeInsets.only(bottom: 60),
                itemBuilder: (context, index) => ReviewItem(reviews[index]),
              );
            }
          },
        ),
      ),
    );
  }
}
