import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
      ),
      // body: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Color.fromARGB(255, 9, 85, 99),
      //         Color.fromARGB(255, 32, 32, 32),
      //         Colors.black,
      //       ],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     ),
      //   ),
      //   child: ListView.builder(
      //     itemCount: loadedMyReviews.length,
      //     padding: const EdgeInsets.only(bottom: 60),
      //     itemBuilder: (context, index) => ChangeNotifierProvider.value(
      //       value: loadedMyReviews[index],
      //       child: Padding(
      //         padding: const EdgeInsets.all(3.0),
      //         child: ReviewItem(loadedMyReviews[index]),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
