class Task {
  String? id;
  String? title;
  bool isDone;

  Task({required this.id, required this.title, this.isDone = false});

  static List<Task> taskList() {
    return [
      Task(id: "01", title: "Hacer la compra"),
      Task(id: "02", title: "Estudiar React"),
      Task(id: "03", title: "Revisar pull requests", isDone: true),
      Task(id: "04", title: "Avanzar app en Flutter"),
      Task(id: "05", title: "Revisar correo", isDone: true),
    ];
  }
}
