import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: screenSize.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: screenSize.width * 0.6,
        itemHeight: screenSize.height * 0.4,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: movies.length,
        // pagination: const SwiperPagination(),
        // control: const SwiperControl()
      ),
    );
  }
}
