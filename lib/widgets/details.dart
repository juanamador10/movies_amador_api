import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_id_provider.dart';
import 'package:movies_new/screens/information_screen.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  final List<dynamic> movies;
  final movieId;
  const Details({Key? key, required this.movies, required this.movieId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ElId = Provider.of<MovieID>(context);
    final movie = movies[movieId];
    final prueba = movie["id"];
    print(prueba);
    const base = "https://image.tmdb.org/t/p/w500";
    final imageURL = base + movie["poster_path"];
    Size size = MediaQuery.of(context).size;
    final List<String> headers = <String>[
      'Release Date',
      'Vote Average',
      'Votes',
      'Popularity'
    ];
    final List<dynamic> info = <dynamic>[
      movie["release_date"],
      movie["vote_average"],
      movie["vote_count"],
      movie["popularity"]
    ];

    return Column(children: [
      Container(
        height: size.height * 0.75 - 20,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          boxShadow: const [BoxShadow(offset: Offset(0, 5), blurRadius: 50)],
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageURL)),
        ),
      ),
      Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: 350,
                  child: Text(
                    movie["original_title"],
                    style: const TextStyle(
                      color: Colors.white,
                      //fontFamily: 'muli',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 12,
                      )),
                  onPressed: () {
                    ElId.movieidS = movie["id"];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InformationScreen()));
                  },
                  child: const Text('Similar Movies')),
              const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 15.0,
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text('Story',
                  style: TextStyle(
                    color: Colors.white,
                    //fontFamily: 'muli',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))),
          SizedBox(
              width: 500,
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    movie["overview"],
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.justify,
                  ))),
          const SizedBox(
            height: 20,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text('Information',
                  style: TextStyle(
                    color: Colors.white,
                    //fontFamily: 'muli',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))),
          Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(children: [
                SizedBox(
                    width: 400,
                    height: 230,
                    child: ListView.separated(
                      itemCount: headers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 40,
                            child: Column(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(headers[index],
                                        style: const TextStyle(
                                            color: Color(0xFF9A9BB2),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('${info[index]}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700)))
                              ],
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    )),
              ]),
            ),
          ),
        ],
      ),
    ]);
  }
}
