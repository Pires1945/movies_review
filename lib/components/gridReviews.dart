import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movies_review/components/reviewItem.dart';
import 'package:movies_review/models/review.dart';
import 'package:movies_review/models/reviewList.dart';
import 'package:provider/provider.dart';

class GridReviews extends StatefulWidget {
  const GridReviews({super.key});

  @override
  State<GridReviews> createState() => _GridReviewsState();
}

class _GridReviewsState extends State<GridReviews> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReviewList>(context);
    final List<Review> loadedReviews = provider.reviews;
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'images/samurais.png',
            fit: BoxFit.cover,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: const [
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
            Flexible(
              child: ListView.builder(
                itemCount: loadedReviews.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: loadedReviews[index],
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ReviewItem(loadedReviews[index]),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
