import 'dart:async';
import 'dart:convert';

import 'package:moviesdb/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzM1YTZkYTA0N2RiMGRmNjczMTI5ZTI2ZWU5OWJiMCIsInN1YiI6IjY0YjgzZDBlNGQyM2RkMDE0NDhjMWFjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KB4oC2QvGxb3Bj0ctI3aKFb8XQabHkFkLK0xggEbrDM';
  String url = 'api.themoviedb.org';
  String lang = 'es-ES';

  int popularPage = 0;
  bool loadingMovies = false;

  String baseUrl = 'api.themoviedb.org';

  List<Movie> popularMovies = List.empty(growable: true);

  StreamController<List<Movie>> popularMoviesController =
      StreamController<List<Movie>>();

  Function(List<Movie>) get popularSink => popularMoviesController.sink.add;
  Stream<List<Movie>> get popularMoviesStream => popularMoviesController.stream;

  MovieProvider() {
    getPopular();
  }

  dispose() {
    popularMoviesController.close();
  }

  Future<List<Movie>> getNowPlaying() async {
    final uri = Uri.https(baseUrl, '/3/movie/now_playing');

    return _processMovies(uri);
  }

  getPopular() async {
    if (loadingMovies) return;

    loadingMovies = true;

    popularPage++;

    final Map<String, String> params = <String, String>{
      'page': popularPage.toString(),
    };
    final uri = Uri.https(baseUrl, '/3/movie/popular', params);

    final movies = await _processMovies(uri);

    popularMovies.addAll(movies);
    popularSink(popularMovies);
    loadingMovies = false;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final Map<String, String> params = <String, String>{
      'query': query,
    };
    final uri = Uri.https(baseUrl, '/3/search/movie', params);

    return _processMovies(uri);
  }

  Future<List<Movie>> _processMovies(Uri uri) async {
    final headers = {
      'Authorization': 'Bearer $apiKey',
    };

    final resp = await http.get(uri, headers: headers);
    final data = json.decode(resp.body);

    final moviesExtracted = Movies.fromJsonList(data['results']);
    return moviesExtracted.items;
  }
}
