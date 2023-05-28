import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
            // Flexible(
            //   child: ListView.builder(
            //     itemCount: loadedReviews.length,
            //     padding: const EdgeInsets.only(bottom: 60),
            //     itemBuilder: (context, index) => ChangeNotifierProvider.value(
            //       value: loadedReviews[index],
            //       child: Padding(
            //         padding: const EdgeInsets.all(3.0),
            //         child: ReviewItem(loadedReviews[index]),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}
