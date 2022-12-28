import 'package:flutter/material.dart';

import 'widgets/taskitem.dart';
import 'models/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'TodoApp', home: Home());
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tasks = Task.taskList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildAppBody());
  }

  Column buildAppBody() {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 10, bottom: 5),
        child: const Text(
          'Tasks',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskItem(
                task: tasks[index],
                onTaskStatusChanged: handleTaskStatusChange,
              );
            }),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: 'Add a new task', border: InputBorder.none),
              ),
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      minimumSize: const Size(60, 60),
                      elevation: 10),
                  onPressed: () {},
                  child: const Icon(Icons.add)),
            )
          ],
        ),
      )
    ]);
  }

  void handleTaskStatusChange(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
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
