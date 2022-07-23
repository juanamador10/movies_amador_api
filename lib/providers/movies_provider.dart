import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:movies_new/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = "a67ab583eeb9d661083ac99b566785c8";
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = "en-US";

  List<dynamic> dataMovies = [];
  List<dynamic> similarMovies = [];

  MoviesProvider(dynamic movieid) {
    getMovies();
    getSimilarM(movieid);
  }

  getMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      //print(jsonResponse);

      dataMovies = jsonResponse["results"];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getSimilarM(dynamic movieid) async {
    var url = Uri.https(_baseUrl, '/3/movie/$movieid/similar',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);

      similarMovies = jsonResponse["results"];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
