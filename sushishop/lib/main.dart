import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/cmps/action_button.dart';
import 'package:sushishop/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SushiShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      routes: {
        '/': (context) => const HomePage(),
        'menu': (context) => const MenuPage()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 130, 60, 55),
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
            Text('SUPER SUSHI',
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white, fontSize: 20)),
            const SizedBox(
              height: 25,
            ),
            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('img/maki.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            // title
            Text(
              'THE TASTE OF JAPANESE FOOD',
              style:
                  GoogleFonts.dmSerifDisplay(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            // subtitle
            Text(
                'Feel the taste of the most popular japanese food, its awesome!',
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white, fontSize: 18)),
            const SizedBox(
              height: 20,
            ),
            // get started
            ActionButton(
              text: "Getting started",
              onTap: () {
                // go to menu page
                Navigator.pushNamed(context, 'menu');
              },
            )
          ],
        ),
      ),
    );
  }
}
