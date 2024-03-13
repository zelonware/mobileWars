import 'package:flutter/material.dart';
import 'package:sushishop/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food piece;
  const FoodTile({super.key, required this.piece});

  @override
  Widget build(BuildContext context) {
    return Text(piece.name);
  }
}
