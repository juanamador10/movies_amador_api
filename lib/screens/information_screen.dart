import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_id_provider.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:movies_new/widgets/widgets.dart';

import 'home_screen.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    final ElId = Provider.of<MovieID>(context, listen: true);
    print(moviesProvider.similarMovies);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(146, 158, 158, 158),
          elevation: 0,
          toolbarHeight: 60,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Similar Movies",
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SimilarMovies(movies: moviesProvider.similarMovies)
        ])));
  }
}
