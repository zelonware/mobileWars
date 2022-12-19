// ignore: implementation_imports
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          onTap: () {
            print("Check task");
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white24,
          leading: const Icon(
            Icons.check_box,
            color: Colors.blue,
          ),
          title: const Text(
            'This is a task',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              // decoration: TextDecoration.lineThrough
            ),
          ),
          trailing: Container(
              padding: const EdgeInsets.all(0),
              // margin: const EdgeInsets.symmetric(vertical: 12),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                color: Colors.white,
                iconSize: 18,
                icon: const Icon(Icons.delete),
                onPressed: () {
                  print('Clicked on delete icon');
                },
              )),
        ));
  }
}
