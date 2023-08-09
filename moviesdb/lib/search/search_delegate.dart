import 'package:flutter/material.dart';

import 'package:moviesdb/providers/movie_provider.dart';

class DataSearch extends SearchDelegate {
  String selection = '';
  final movieProvider = MovieProvider();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.menu_open));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: movieProvider.searchMovies(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final foundMovies = snapshot.data!;
          return ListView.builder(
            itemCount: foundMovies.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(foundMovies[index].title),
                leading: const Icon(
                  Icons.movie,
                ),
                onTap: () {
                  close(context, null);
                  Navigator.pushNamed(context, 'detail',
                      arguments: foundMovies[index]);
                },
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
