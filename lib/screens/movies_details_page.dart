import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../utils/text.dart';
import 'movies_overview_page.dart';

class MoviesDetailsPage extends StatelessWidget {
  const MoviesDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final Results results = ModalRoute.of(context)!.settings.arguments as Results;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (_) {
                  return const MoviesOverviewPage();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    // child: Image.network(
                    //   movie.backdropPath!,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Container(),
                    // ModifiedText(
                    //   text: '⭐ Average Rating - ' + movie.voteCount!.toString(),
                    // ),
                ),
              ])),
          SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(
                  text: results.title != null ? results.title! : 'Not Loaded', size: 24)),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: Container(),
              // ModifiedText(text: 'Releasing On - ${movie.releaseDate!}', size: 14),
          ),
          Row(
            children: [
              // Container(
              //   height: 200,
              //   width: 100,
              //   child: Image.network(movie.posterPath!),
              // ),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Container(),
                  //ModifiedText(text: movie.overview!, size: 18),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
