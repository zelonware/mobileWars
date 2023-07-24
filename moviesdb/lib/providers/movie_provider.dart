import 'dart:convert';

import 'package:moviesdb/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  String apiKey = '';
  String url = 'api.themoviedb.org';
  String lang = 'es-ES';

  String baseUrl = 'api.themoviedb.org';

  Future<List<Movie>> getNowPlaying() async {
    final uri = Uri.https(baseUrl, '/3/movie/now_playing');

    return processMovies(uri);
  }

  Future<List<Movie>> getPopular() async {
    final uri = Uri.https(baseUrl, '/3/movie/popular');

    return processMovies(uri);
  }

  Future<List<Movie>> processMovies(Uri uri) async {
    final headers = {
      'Authorization': 'Bearer $apiKey',
    };
    final resp = await http.get(uri, headers: headers);
    final data = json.decode(resp.body);

    final moviesExtracted = Movies.fromJsonList(data['results']);
    return moviesExtracted.items;
  }
}
