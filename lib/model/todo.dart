class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone  = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Do excercise', isDone: true),
      ToDo(id: '02', todoText: 'Read a book', isDone: true),
      ToDo(id: '03', todoText: 'Study Inglish',),
      ToDo(id: '04', todoText: 'Check emails',),
      ToDo(id: '05', todoText: 'Go to gym', isDone: true),
    ];
  }
}