import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;

  const MovieSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 1),
      child: SizedBox(
        height: screenSize.height * 0.22,
        child: PageView(
          pageSnapping: false,
          padEnds: false,
          controller: PageController(initialPage: 1, viewportFraction: 0.3),
          children: cards(context),
        ),
      ),
    );
  }

  List<Widget> cards(BuildContext c) {
    return movies.map((e) {
      return Container(
        margin: const EdgeInsets.only(right: 15),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('imgs/nia.jpg'),
              image: NetworkImage(e.getPosterPath()),
              fit: BoxFit.cover,
              height: 160,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            e.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(c).textTheme.bodySmall,
          )
        ]),
      );
    }).toList();
  }
}
