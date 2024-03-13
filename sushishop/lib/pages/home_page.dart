import 'package:flutter/material.dart';
import 'package:sushishop/cmps/action_button.dart';
import 'package:sushishop/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25,
            ),
            // name
            const Text('SUPER SUSHI',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(
              height: 25,
            ),
            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/img/maki.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            // title
            const Text(
              'THE TASTE OF JAPANESE FOOD',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            // subtitle
            const Text(
                'Feel the taste of the most popular japanese food, its awesome!',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(
              height: 20,
            ),
            // get started
            ActionButton(
              text: "Get started",
              onTap: () {
                Navigator.pushNamed(context, 'menu');
              },
            )
          ],
        ),
      ),
    );
  }
}
