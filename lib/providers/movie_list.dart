import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../utils/constants.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieList with ChangeNotifier {

  final String apikey = '819973ed485b9ab6aa8de9e286b83222';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MTk5NzNlZDQ4NWI5YWI2YWE4ZGU5ZTI4NmI4MzIyMiIsInN1YiI6IjY0MTljYWFkMGQ1ZDg1MDBlMGU3Y2Q3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GT0IRK7KpFjgawUAiPgZTYSa2zxQlogk3nGLSoJP8YU';
  var page = 1;
  //
  // loadMovies() async {
  //   TMDB tmdbWithCustomLogs = TMDB(
  //     ApiKeys(apikey, readAccessToken),
  //     logConfig: const ConfigLogger(
  //       showLogs: true,
  //       showErrorLogs: true,
  //     ),
  //   );
  //
  //   Map TopRated = await tmdbWithCustomLogs.v3.movies.getTopRated();
  //   print((TopRated));
  //   List<Results> topRatedMovies = TopRated['results'];
  // }

  final List<Movie> _items = [];
  print(_items) {
    print(_items);
  }

  List<Movie> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  Future<List<Results>?> loadMovies() async {
    _items.clear();

    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map TopRated = await tmdbWithCustomLogs.v3.movies.getTopRated();
    // print(TopRated['results']);

    List<Results> topRatedMovies = [];
    // print(topRatedMovies);

    for(var i = 0; i < TopRated['results'].length; i++){
      //print(TopRated);
      // print(TopRated['results'][i]['id']);
      // print(TopRated['results'][i]['title']);
      // print(TopRated['results'][i]['backdrop_path']);
      // print(TopRated['results'][i]['overview']);
      // print(TopRated['results'][i]['poster_path']);
      // print(TopRated['results'][i]['release_date']);
      // print(TopRated['results'][i]['vote_average']);
      // print(TopRated['results'][i]['vote_count']);

      topRatedMovies.add(
        Results(
           id: TopRated['results'][i]['id'],
           title: TopRated['results'][i]['title'],
           backdropPath: TopRated['results'][i]['backdrop_path'],
           overview: TopRated['results'][i]['overview'],
           posterPath: TopRated['results'][i]['poster_path'],
           releaseDate: TopRated['results'][i]['release_date'],
           voteAverage: TopRated['results'][i]['vote_average'],
           voteCount: TopRated['results'][i]['vote_count'],
        ),
      );
      return topRatedMovies;
    }
    // final response = await http.get(
    //   Uri.parse('${Constants.movieBaseUrl}.json'),
    // );
    // print(jsonDecode(response.body));
    // if (response.body == 'null') return;
    //
    // Map<String, dynamic> data = jsonDecode(response.body);
    //
    // print(data);
    print('Results + {$topRatedMovies}');

    TopRated.forEach(
      (movieId, movieData) //chave e valor
      {
        _items.add(
          Movie(
            page,
            topRatedMovies,
          ),
        );
      },
    );
    notifyListeners();
  }
}
