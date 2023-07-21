import 'package:flutter/material.dart';
import 'package:moviesdb/providers/movie_provider.dart';

import '../widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  final movieProvider = MovieProvider();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search))
      ]),
      body: Column(
        children: [
          getCardSwiper(),
        ],
      ),
    );
  }

  Widget getCardSwiper() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(movies: snapshot.data ?? []);
        } else {
          return Container(
              padding: const EdgeInsets.all(20),
              child: const Center(child: CircularProgressIndicator()));
        }
      },
      future: movieProvider.getNowPlaying(),
    );
  }
}
