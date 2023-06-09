import 'package:flutter/material.dart';
import 'package:movies_review/core/service/movie/movie_service.dart';
import '../core/models/movie.dart';
import 'movieItem.dart';

class MovieGrid extends StatefulWidget {
  const MovieGrid({super.key});

  @override
  State<MovieGrid> createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  bool isSearch = false;
  final _formKey = GlobalKey<FormState>();
  late String _searchText;

  Future<void> _submitSearch() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    _formKey.currentState?.save();
    setState(() => isSearch = false);

    await MovieService().searchMovie(_searchText);
    print(_searchText);
  }

  @override
  void initState() {
    super.initState();
    MovieService().loadMovies();
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
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              color: const Color.fromARGB(255, 20, 20, 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: isSearch
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            autofocus: true,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            onSaved: (newValue) =>
                                _searchText = newValue as String,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: _submitSearch,
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 36,
                                  )),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 71, 71, 71),
                            ),
                            // validator: (value) {
                            //   final name = value ?? '';
                            // },
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Filmes',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isSearch = true;
                              });
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 36,
                            ),
                          )
                        ],
                      ),
              ),
            ),
            isSearch
                ? const Text('Busca....')
                : StreamBuilder<List<Movie>>(
                    stream: MovieService().movieStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final movies = snapshot.data!;
                        return Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 55),
                            child: GridView.builder(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 250,
                              ),
                              itemCount: movies.length,
                              itemBuilder: (context, index) =>
                                  MovieItem(snapshot.data![index]),
                            ),
                          ),
                        );
                      }
                    },
                  ),
          ],
        )
      ],
    );
  }
}
