import 'package:flutter/material.dart';
import 'package:flutter_application_todo/item_todo.dart';
import 'package:flutter_application_todo/constants/colors.dart';
import 'package:flutter_application_todo/model/todo.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundItem = [];

  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundItem = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BGColor,
      //appBar: _buidlAppBar(),

      body: Stack(
        children: [
          Container( 
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

            child: Column(
              children: [
                //searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      searchBox(),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        child: const Text(
                          'Things to do', 
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      for (ToDo todoo in _foundItem.reversed)
                        ToDoItem(
                          todo: todoo, 
                          onToDoChanged: _handleToDoChange,
                          DeleteItem: _deleteToDoItem,
                        ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),

          // text field add new task
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 15, right: 20, left: 20,
                  ),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 5,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Grey, 
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),],

                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                      hintText: 'Add new task',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),

              // button add new task
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10, right: 25,
                ),
                
                child: ElevatedButton(
                  onPressed: () {
                    _addNewItem(_todoController.text);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Blue,
                    minimumSize: const Size(50, 50),
                    elevation: 10,
                  ),
                  
                  child: const Text('+', 
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ]),

          ),
        ],
      ),
    );
  }

  // check box
  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addNewItem(String task){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: task));
    });
    _todoController.clear();
  }

  void _searchItem(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todosList;
    } else {
      results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundItem = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
     
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      
      child: TextField(
        onChanged: (value) => _searchItem(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(15),
          
          prefixIcon: Icon(
            Icons.search,
            color: Grey,
            size: 20,
          ),

          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),

          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Grey),
        ),
      ),
    );
  }

  AppBar _buidlAppBar() {
    return AppBar(
      backgroundColor: BGColor,
      elevation: 0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Icon(
            Icons.menu,
            color: Black,
            size: 30,
          ),
        ],
      ),
    );
  }
}
