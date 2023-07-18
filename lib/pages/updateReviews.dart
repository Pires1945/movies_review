import 'package:flutter/material.dart';

import '../core/models/movie.dart';
import '../core/models/review.dart';

class UpdateReview extends StatefulWidget {
  const UpdateReview({super.key});

  @override
  State<UpdateReview> createState() => _UpdateReviewState();
}

class _UpdateReviewState extends State<UpdateReview> {
  @override
  Widget build(BuildContext context) {
    final Review review = ModalRoute.of(context)!.settings.arguments as Review;
    final Movie movie;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Minha avaliação ',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            //key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${review.movieTitle} :',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      constraints: const BoxConstraints.expand(height: 100),
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      labelText: review.review,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: const TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 71, 71, 71),
                    ),
                    maxLines: 30,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Colors.white),
                    //onSaved: (newValue) => _formData['review'] = newValue ?? '',
                  ),
                ),
                const Text(
                  'Avaliação :',
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          //movie.setStars(1);
                        });
                        //_formData['avaliation'] = 1;
                      },
                      icon: Icon(
                        review.avaliation > 0 ? Icons.star : Icons.star_border,
                      ),
                      color: const Color.fromARGB(255, 146, 132, 4),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          //movie.setStars(2);
                        });
                        //_formData['avaliation'] = 2;
                      },
                      icon: Icon(
                        review.avaliation > 1 ? Icons.star : Icons.star_border,
                      ),
                      color: const Color.fromARGB(255, 146, 132, 4),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          //movie.setStars(3);
                        });
                        //_formData['avaliation'] = 3;
                      },
                      icon: Icon(
                        review.avaliation > 2 ? Icons.star : Icons.star_border,
                      ),
                      color: const Color.fromARGB(255, 146, 132, 4),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          // movie.setStars(4);
                        });
                        //_formData['avaliation'] = 4;
                      },
                      icon: Icon(
                        review.avaliation > 3 ? Icons.star : Icons.star_border,
                      ),
                      color: const Color.fromARGB(255, 146, 132, 4),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          //movie.setStars(5);
                        });
                        //_formData['avaliation'] = 5;
                      },
                      icon: Icon(
                        review.avaliation > 4 ? Icons.star : Icons.star_border,
                      ),
                      color: const Color.fromARGB(255, 146, 132, 4),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 114, 113, 113)),
                  child: const Text('Enviar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
