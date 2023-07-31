import 'package:flutter/material.dart';
import 'package:moviesdb/providers/movie_provider.dart';
import 'package:moviesdb/widgets/movie_slider.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [getCardSwiper(), getFooter()],
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

  Widget getFooter() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text('Popular')),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MovieSlider(
                    movies: snapshot.data ?? [],
                    nextPage: movieProvider.getPopular);
              } else {
                return Container(
                    padding: const EdgeInsets.all(20),
                    child: const Center(child: CircularProgressIndicator()));
              }
            },
            stream: movieProvider.popularMoviesStream,
          )
        ],
      ),
    );
  }
}
