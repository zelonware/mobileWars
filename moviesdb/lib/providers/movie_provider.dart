import 'dart:async';
import 'dart:convert';

import 'package:moviesdb/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzM1YTZkYTA0N2RiMGRmNjczMTI5ZTI2ZWU5OWJiMCIsInN1YiI6IjY0YjgzZDBlNGQyM2RkMDE0NDhjMWFjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KB4oC2QvGxb3Bj0ctI3aKFb8XQabHkFkLK0xggEbrDM';
  String url = 'api.themoviedb.org';
  String lang = 'es-ES';

  int popularPage = 1;

  String baseUrl = 'api.themoviedb.org';

  List<Movie> popularMovies = List.empty();

  StreamController<List<Movie>> popularMoviesController =
      StreamController<List<Movie>>();

  Function(List<Movie>) get popularSink => popularMoviesController.sink.add;
  Stream<List<Movie>> get popularMoviesStream => popularMoviesController.stream;

  dispose() {
    popularMoviesController.close();
  }

  Future<List<Movie>> getNowPlaying() async {
    final uri = Uri.https(baseUrl, '/3/movie/now_playing');

    return processMovies(uri);
  }

  Future<List<Movie>> getPopular() async {
    popularPage++;

    final uri = Uri.https(baseUrl, '/3/movie/popular?page=$popularPage');

    return processMovies(uri);
  }

  Future<List<Movie>> processMovies(Uri uri) async {
    final headers = {
      'Authorization': 'Bearer $apiKey',
    };
    final resp = await http.get(uri, headers: headers);
    final data = json.decode(resp.body);

    final moviesExtracted = Movies.fromJsonList(data['results']);
    popularMovies.addAll(moviesExtracted.items);
    popularSink(popularMovies);

    return moviesExtracted.items;
  }
}
