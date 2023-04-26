import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyReviews extends StatefulWidget {
  const MyReviews({super.key});

  @override
  State<MyReviews> createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        title: const Text(
          'Minhas Avaliações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
