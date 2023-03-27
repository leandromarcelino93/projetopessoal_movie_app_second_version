import 'package:flutter/material.dart';
import 'package:projetopessoal_movie_app_second_version/screens/movies_details_page.dart';
import 'package:provider/provider.dart';
import 'models/movie.dart';
import 'providers/movie_list.dart';
import 'screens/movies_overview_page.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Results(),
        ),
        ChangeNotifierProvider(
          create: (_) => Movie(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData.dark(),
        routes: {
          AppRoutes.HOME: (ctx) => const MoviesOverviewPage(),
          AppRoutes.MOVIES_DETAILS: (ctx) => const MoviesDetailsPage(),
        },
      ),
    );
  }
}

