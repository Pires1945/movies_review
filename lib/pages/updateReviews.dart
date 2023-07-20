import 'package:flutter/material.dart';
import 'package:movies_review/core/service/movie/movieDataService.dart';
import 'package:movies_review/core/service/review/reviewService.dart';

import '../core/models/movie.dart';
import '../core/models/review.dart';
import '../core/service/movie/movie_service.dart';

class UpdateReview extends StatefulWidget {
  const UpdateReview({super.key});

  @override
  State<UpdateReview> createState() => _UpdateReviewState();
}

class _UpdateReviewState extends State<UpdateReview> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    ReviewService().updateReview(_formData);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    MovieService().loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    final Review review = ModalRoute.of(context)!.settings.arguments as Review;
    _formData['id'] = review.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Minha avaliação ',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: StreamBuilder<List<Movie>>(
          stream: MovieDataService().movieStream(),
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
              final movies = snapshot.data!
                  .where((element) => element.id == review.movieId)
                  .toList();
              final Movie movie = movies[0];
              return Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${review.movieTitle} :',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              constraints:
                                  const BoxConstraints.expand(height: 100),
                              alignLabelWithHint: true,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              labelText: review.review,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle:
                                  const TextStyle(color: Colors.white54),
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
                            onSaved: (newValue) =>
                                _formData['review'] = newValue ?? '',
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
                                  movie.setStars(1);
                                });
                                _formData['avaliation'] = 1;
                              },
                              icon: Icon(
                                movie.countStar > 0
                                    ? Icons.star
                                    : Icons.star_border,
                              ),
                              color: const Color.fromARGB(255, 146, 132, 4),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  movie.setStars(2);
                                });
                                _formData['avaliation'] = 2;
                              },
                              icon: Icon(
                                movie.countStar > 1
                                    ? Icons.star
                                    : Icons.star_border,
                              ),
                              color: const Color.fromARGB(255, 146, 132, 4),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  movie.setStars(3);
                                });
                                _formData['avaliation'] = 3;
                              },
                              icon: Icon(
                                movie.countStar > 2
                                    ? Icons.star
                                    : Icons.star_border,
                              ),
                              color: const Color.fromARGB(255, 146, 132, 4),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  movie.setStars(4);
                                });
                                _formData['avaliation'] = 4;
                              },
                              icon: Icon(
                                movie.countStar > 3
                                    ? Icons.star
                                    : Icons.star_border,
                              ),
                              color: const Color.fromARGB(255, 146, 132, 4),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  movie.setStars(5);
                                });
                                _formData['avaliation'] = 5;
                              },
                              icon: Icon(
                                movie.countStar > 4
                                    ? Icons.star
                                    : Icons.star_border,
                              ),
                              color: const Color.fromARGB(255, 146, 132, 4),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 114, 113, 113)),
                          child: const Text('Enviar'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
