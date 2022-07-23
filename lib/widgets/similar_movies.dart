import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_new/screens/details_screen2.dart';
import 'package:movies_new/widgets/widgets.dart';

import '../screens/details_screen.dart';

class SimilarMovies extends StatelessWidget {
  final List<dynamic> movies;
  
  const SimilarMovies({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const base = "https://image.tmdb.org/t/p/w500";
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height:size.height,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: 600,
        itemWidth: 350,
        itemBuilder: (_,int index){
          final movie = movies[index];
          final imageURL = base + movie["poster_path"];
          final Id = movie["id"];
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen2(Idmovie: index))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                //child: Expanded(
                child: FadeInImage(
                    placeholder: const NetworkImage(
                        "https://hips.hearstapps.com/hmg-prod/images/bestteenmovies-1612822987.jpg?crop=1.00xw:1.00xh;0,0&resize=980:*"),
                    image: NetworkImage(imageURL),
                    fit: BoxFit.cover),
                //)
              ));
        },
      ),
    );
  }
}