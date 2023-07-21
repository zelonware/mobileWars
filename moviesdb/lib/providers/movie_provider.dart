import 'dart:convert';

import 'package:moviesdb/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  String apiKey = '';
  String url = 'api.themoviedb.org';
  String lang = 'es-ES';

  Future<List<Movie>> getNowPlaying() async {
    final uri = Uri.https('api.themoviedb.org', '/3/movie/now_playing');
    final headers = {
      'Authorization': 'Bearer $apiKey',
    };
    final resp = await http.get(uri, headers: headers);
    final data = json.decode(resp.body);

    final moviesExtracted = Movies.fromJsonList(data['results']);
    return moviesExtracted.items;
  }
}
