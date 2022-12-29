import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final onTaskStatusChanged;
  final onTaskDeleted;

  const TaskItem(
      {super.key,
      required this.task,
      required this.onTaskDeleted,
      required this.onTaskStatusChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          onTap: () {
            // print("Check task");
            onTaskStatusChanged(task);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white24,
          leading: Icon(
            task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
          title: Text(
            task.title!,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: task.isDone ? TextDecoration.lineThrough : null),
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
                  // print('Clicked on delete icon');
                  onTaskDeleted(task.id);
                },
              )),
        ));
  }
}
