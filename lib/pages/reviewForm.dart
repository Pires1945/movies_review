import 'package:flutter/material.dart';
import 'package:movies_review/core/service/auth/auth_service.dart';
import 'package:movies_review/core/service/review/reviewService.dart';

import '../core/models/movie.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  Future<void> _submitForm() async {
    final user = AuthService().currentUser;
    final isValid = _formKey.currentState?.validate() ?? false;

    _formData['userId'] = AuthService().currentUser!.userId;
    _formData['userImage'] = AuthService().currentUser!.imageUrl;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    if (user != null) {
      ReviewService().saveReview(_formData);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    _formData['movieTitle'] = movie.title;
    _formData['movieId'] = movie.id;
    _formData['date'] = DateTime.now();

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
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${movie.title} :',
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
                      labelText: 'Deixe sua opinião...',
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
                    onSaved: (newValue) => _formData['review'] = newValue ?? '',
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
                        movie.countStar > 0 ? Icons.star : Icons.star_border,
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
                        movie.countStar > 1 ? Icons.star : Icons.star_border,
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
                        movie.countStar > 2 ? Icons.star : Icons.star_border,
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
                        movie.countStar > 3 ? Icons.star : Icons.star_border,
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
                        movie.countStar > 4 ? Icons.star : Icons.star_border,
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
      ),
    );
  }
}
