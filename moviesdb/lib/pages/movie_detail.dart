import 'package:flutter/material.dart';
import 'package:moviesdb/models/movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(movie),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 60,
            ),
            _poster(movie),
            _description(movie),
            _additionalInfo(movie),
          ]))
        ],
      ),
    );
  }

  Widget _appBar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      centerTitle: true,
      title: Text(
        movie.title,
        style: const TextStyle(fontSize: 16),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          placeholder: const AssetImage('imgs/loading.gif'),
          image: NetworkImage(movie.getBackdropPath()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _additionalInfo(Movie movie) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Release date: ${movie.releaseDate}'),
          Text('Adult movie: ${(movie.adult ? 'yes' : 'no')}'),
        ]));
  }

  Widget _poster(Movie movie) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: NetworkImage(
              movie.getPosterPath(),
            ),
            height: 150,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(movie.originalTitle)
          ],
        ))
      ]),
    );
  }

  Widget _description(Movie movie) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(movie.overview, textAlign: TextAlign.justify),
    );
  }
}
