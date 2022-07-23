import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:movies_new/widgets/details.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Idmovie;
  const DetailsScreen({Key? key, required this.Idmovie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
        backgroundColor: Colors.purple[900],
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(146, 158, 158, 158),
          elevation: 0,
          toolbarHeight: 60,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            //Navigator.push(context,
            //    MaterialPageRoute(builder: (context) => const HomeScreen()));
            //},
            color: Colors.white,
          ),
          title: const Text("Movies", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Details(movies: moviesProvider.dataMovies, movieId: Idmovie)
            ],
          ),
        ));
  }
}
