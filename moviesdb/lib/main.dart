import 'package:flutter/material.dart';

import 'package:moviesdb/pages/home_page.dart';
import 'package:moviesdb/pages/movie_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoviesDB',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'detail': (context) => const MovieDetailPage(),
      },
    );
  }
}
