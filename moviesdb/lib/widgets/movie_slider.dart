import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;

  final pController = PageController(initialPage: 1, viewportFraction: 0.3);

  MovieSlider({super.key, required this.movies, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    pController.addListener(() {
      if (pController.position.pixels >=
          pController.position.maxScrollExtent - 500) {
        nextPage();
      }
    });

    return Container(
      margin: const EdgeInsets.only(left: 1),
      child: SizedBox(
        height: screenSize.height * 0.28,
        child: PageView.builder(
          pageSnapping: false,
          padEnds: false,
          controller: pController,
          itemCount: movies.length,
          itemBuilder: (context, index) => movieCard(context, movies[index]),
        ),
      ),
    );
  }

  Widget movieCard(BuildContext c, Movie movie) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('imgs/nia.jpg'),
            image: NetworkImage(movie.getPosterPath()),
            fit: BoxFit.cover,
            height: 180,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(c).textTheme.bodySmall,
        )
      ]),
    );
  }
}
