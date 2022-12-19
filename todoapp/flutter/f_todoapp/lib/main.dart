import 'package:f_todoapp/widgets/task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, title: 'TodoApp', home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            // const Text('Here goes the search bar'),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              child: const Text(
                'Tasks',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
                child: ListView(children: [
              TaskItem(),
              TaskItem(),
              TaskItem(),
              TaskItem(),
            ]))
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/000/574/215/original/vector-sign-of-user-icon.jpg'),
          ),
        )
      ]),
    );
  }
}
