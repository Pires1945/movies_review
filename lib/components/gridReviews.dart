import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_review/components/reviewItem.dart';
import 'package:movies_review/core/models/review.dart';
import 'package:movies_review/core/service/review/reviewService.dart';

class GridReviews extends StatefulWidget {
  const GridReviews({super.key});

  @override
  State<GridReviews> createState() => _GridReviewsState();
}

class _GridReviewsState extends State<GridReviews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
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
        ),
        Container(
          color: const Color.fromARGB(112, 54, 54, 54),
        ),
        Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: const Color.fromARGB(255, 20, 20, 20),
              child: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Avaliações',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<List<Review>>(
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
                  final reviews = snapshot.data!;
                  return Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ListView.builder(
                        itemCount: reviews.length,
                        padding: const EdgeInsets.only(bottom: 60),
                        itemBuilder: (context, index) =>
                            ReviewItem(snapshot.data![index]),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
