import 'package:flutter/material.dart';
import 'package:sushishop/cmps/action_button.dart';
import 'package:sushishop/theme/colors.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
          children: [
            // promo bar
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(25),
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
                    'img/mix.png',
                    height: 100,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // search
            Container(
              color: primaryColor,
              child: const Text('search bar',
                  style: TextStyle(color: Colors.white)),
            ),

            // this is it, thanks for watching! 👋🏻

            // menu items
            Container(
              color: primaryColor,
              child: const Text('menu list',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ));
  }
}
