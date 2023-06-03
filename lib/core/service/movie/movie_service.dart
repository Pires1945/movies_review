import 'package:movies_review/core/service/movie/movieDataService.dart';

import '../../models/movie.dart';

abstract class MovieService {
  Stream<List<Movie>> movieStream();

  Future<void> loadMovies();

  factory MovieService() {
    return MovieDataService();
  }
}
