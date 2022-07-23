import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:movies_new/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    //print(moviesProvider.dataMovies);

    return Scaffold(
        backgroundColor: Colors.purple[900],
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(146, 158, 158, 158),
          elevation: 0,
          toolbarHeight: 60,
          title: const Text("Movies", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //TODO CardSwiper
                CardSwiper(movies: moviesProvider.dataMovies),
              ],
            ),
          ),
        ]));
  }
}
