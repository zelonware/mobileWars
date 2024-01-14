import 'package:flutter/material.dart';
import 'package:sushishop/pages/menu_page.dart';
import 'package:sushishop/pages/home_page.dart';
import 'package:sushishop/theme/colors.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
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
