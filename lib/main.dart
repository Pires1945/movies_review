import 'package:flutter/material.dart';
import 'package:movies_review/components/gridReviews.dart';
import 'package:movies_review/components/movieGrid.dart';
import 'package:movies_review/models/movieList.dart';
import 'package:movies_review/models/reviewList.dart';
import 'package:movies_review/models/user.dart';
import 'package:movies_review/pages/authOrHome.dart';
import 'package:movies_review/pages/homePage.dart';
import 'package:movies_review/pages/login.dart';
import 'package:movies_review/pages/movieDetail.dart';
import 'package:movies_review/pages/reviewForm.dart';
import 'package:movies_review/pages/settings.dart';
import 'package:movies_review/pages/signUp.dart';
import 'package:movies_review/utils/appRoutes.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (context) => ReviewList()),
        ChangeNotifierProvider(create: (context) => User()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.AUTHORHOME: (context) => AuthOrHome(),
          AppRoutes.SIGNUP: (context) => SignUp(),
          AppRoutes.SETTINGS: (context) => Settings(),
          AppRoutes.MOVIEGRID: (context) => MovieGrid(),
          AppRoutes.MOVIEDETAIL: (context) => MovieDetail(),
          AppRoutes.REVIEWFORM: (context) => ReviewForm(),
          AppRoutes.GRIDREVIEWS: (context) => GridReviews(),
        },
      ),
    );
  }
}
