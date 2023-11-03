// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/todo.dart';
import 'constants/colors.dart';

class ToDoItem extends StatelessWidget {

  final ToDo todo;
  final onToDoChanged;
  final DeleteItem;


  ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.DeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),   
        ),
        
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank, 
          color: Blue,
        ),

        title: Text(  
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          )
        ),
        
        // delete button
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 0),
          height: 35, width: 35,
          
          decoration: BoxDecoration(
            color: Red,
            borderRadius: BorderRadius.circular(5),
          ),
          
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
           
            onPressed: () {
              DeleteItem(todo.id);
            },
          )
        )
      ),
    );
  }
}