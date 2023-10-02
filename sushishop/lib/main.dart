import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 130, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            // name
            Text('SUPER SUSHI',
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white, fontSize: 22)),
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
                  GoogleFonts.dmSerifDisplay(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            // subtitle
            Text(
                'Feel the taste of the most popular japanese food, its awesome!',
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white, fontSize: 18)),

            // get started
          ],
        ),
      ),
    );
  }
}
