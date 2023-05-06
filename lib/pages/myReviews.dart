import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movies_review/models/auth.dart';
import 'package:movies_review/models/review.dart';
import 'package:movies_review/models/reviewList.dart';
import 'package:movies_review/models/userList.dart';
import 'package:provider/provider.dart';

import '../components/reviewItem.dart';
import '../models/user.dart';

class MyReviews extends StatefulWidget {
  const MyReviews({super.key});

  @override
  State<MyReviews> createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ReviewList>(context, listen: false).loadMyReviews();
  }

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewList>(context);
    final List<Review> allReviews = reviewProvider.myReviews.reversed.toList();
    final user = reviewProvider.userId;

    final List<Review> loadedMyReviews =
        allReviews.where((element) => element.userId == user).toList();

    print(loadedMyReviews.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedMyReviews.length.toString()),
      ),
      body: ListView.builder(
        itemCount: loadedMyReviews.length,
        padding: const EdgeInsets.only(bottom: 60),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: loadedMyReviews[index],
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(loadedMyReviews[index].userId),
          ),
        ),
      ),
    );
  }
}
