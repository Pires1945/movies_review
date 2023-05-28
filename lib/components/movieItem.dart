import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_review/utils/appRoutes.dart';
import 'package:provider/provider.dart';

import '../core/models/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    const baseUrlImage = 'https://image.tmdb.org/t/p/w220_and_h330_face';

    final movie = Provider.of<Movie>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            movie.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            baseUrlImage + movie.backdrop_path,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.MOVIEDETAIL, arguments: movie);
          },
        ),
      ),
    );
  }
}
