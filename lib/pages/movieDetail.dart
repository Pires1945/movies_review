import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_review/utils/appRoutes.dart';

import '../core/models/movie.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const baseUrlImage = 'https://image.tmdb.org/t/p/w220_and_h330_face';
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    //var totalStarsMovie = 0;

    // final reviewsMovie = reviews
    //     .where(
    //       (element) => element.movieId == movie.id,
    //     )
    //     .toList();

    // reviewsMovie.forEach(
    //   (element) => totalStarsMovie = totalStarsMovie + element.avaliation,
    // );

    // var mediaStarMovie = totalStarsMovie / reviewsMovie.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Image.network(
                  baseUrlImage + movie.image,
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Avaliação dos usuários',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Stars(mediaStarMovie),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                              AppRoutes.REVIEWFORM,
                              arguments: movie);
                        },
                        icon: const Icon(
                          Icons.reviews,
                          color: Colors.white70,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Color.fromARGB(255, 49, 49, 49),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 20),
                        child: Text(
                          movie.overview,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
