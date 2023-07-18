import 'package:flutter/material.dart';

import '../widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    final movies = [1, 2, 3, 4, 5];

    return CardSwiper(movies: movies);
  }
}
