import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:movies_new/widgets/details.dart';
import 'package:provider/provider.dart';

class DetailsScreen2 extends StatelessWidget {
  final Idmovie;
  const DetailsScreen2({Key? key, required this.Idmovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Details(movies: moviesProvider.similarMovies, movieId: Idmovie)
        ],
      )),
    );
  }
}
