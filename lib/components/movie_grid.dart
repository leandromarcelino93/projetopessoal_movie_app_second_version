import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/movie_list.dart';
import '../utils/app_routes.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<MovieList>(context);
    final List<Movie> loadedMovies = provider.items;
    final results = Provider.of<Results>(context);
    // final movies = Provider.of<Movie>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            textAlign: TextAlign.center,
            'Filmes com as Melhores Avaliações ⭐',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: loadedMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.MOVIES_DETAILS,
                      arguments: results,
                    );
                  },
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        // Container(
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: NetworkImage(
                        //         // ignore: prefer_interpolation_to_compose_strings
                        //           'https://image.tmdb.org/t/p/w500' + results.posterPath!
                        //               ),
                        //     ),
                        //   ),
                        //   height: 300,
                        // ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            results.title!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
