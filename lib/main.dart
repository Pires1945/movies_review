import 'package:flutter/material.dart';
import 'package:movies_review/components/gridReviews.dart';
import 'package:movies_review/components/movieGrid.dart';
import 'package:movies_review/pages/authOrHome.dart';
import 'package:movies_review/pages/movieDetail.dart';
import 'package:movies_review/pages/myReviews.dart';
import 'package:movies_review/pages/registerPage.dart';
import 'package:movies_review/pages/reviewForm.dart';
import 'package:movies_review/pages/settings.dart';
import 'package:movies_review/pages/userPage.dart';
import 'package:movies_review/utils/appRoutes.dart';
import 'package:provider/provider.dart';

import 'core/models/movieList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.AUTHORHOME: (context) => AuthOrHome(),
          AppRoutes.SETTINGS: (context) => Settings(),
          AppRoutes.MOVIEGRID: (context) => MovieGrid(),
          AppRoutes.MOVIEDETAIL: (context) => MovieDetail(),
          AppRoutes.REVIEWFORM: (context) => ReviewForm(),
          AppRoutes.GRIDREVIEWS: (context) => GridReviews(),
          AppRoutes.REGISTERFORM: (context) => RegisterPageForm(),
          AppRoutes.USER: (context) => UserPage(),
          AppRoutes.MYREVIEWS: (context) => MyReviews(),
        },
      ),
    );
  }
}
