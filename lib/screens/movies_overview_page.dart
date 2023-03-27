import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/movie_grid.dart';
import '../providers/movie_list.dart';

class MoviesOverviewPage extends StatefulWidget {
  const MoviesOverviewPage({Key? key}) : super(key: key);

  @override
  State<MoviesOverviewPage> createState() => _MoviesOverviewPageState();
}

class _MoviesOverviewPageState extends State<MoviesOverviewPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<MovieList>(context, listen: false).loadMovies().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Movie DB App'),
        actions: [
          IconButton(
            onPressed: () {
              //Função que filtre os filmes
            },
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : const Padding(
              padding: EdgeInsets.all(10.0),
              child: MovieGrid(),
            ),
    );
  }
}
