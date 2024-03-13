import 'package:flutter/material.dart';
import 'package:sushishop/cmps/action_button.dart';
import 'package:sushishop/cmps/foodtile.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Food> foodies = [
    Food(
        name: 'Salmon maki', price: 10, imgPath: 'lib/img/maki.png', rating: 5),
    Food(
        name: 'Salmon nigiri',
        price: 10,
        imgPath: 'lib/img/salmon.png',
        rating: 5),
    Food(
        name: 'Tuna nigiri', price: 10, imgPath: 'lib/img/tuna.png', rating: 5),
    Food(name: 'Mix maki', price: 10, imgPath: 'lib/img/mix.png', rating: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 233, 233),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promo bar
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Get 15% discount!',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ActionButton(
                        text: 'Redeem',
                        onTap: () {
                          // dont do this at home/prod env, kids! 😋
                          print('Redeem code!');
                        },
                      )
                    ],
                  ),
                  Image.asset(
                    'lib/img/mix.png',
                    height: 100,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // menu items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Menu',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: primaryColor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(foodies.length.toString())
            Expanded(
                child: ListView.builder(
                    itemCount: foodies.length, // 🤔🤔🤔🤔
                    itemBuilder: (context, index) =>
                        FoodTile(piece: foodies[index])))
          ],
        ));
  }
}
