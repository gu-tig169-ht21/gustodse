import 'package:flutter/material.dart';
import 'todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key, required this.todo}) : super(key: key);

  final TodoItem todo;

  @override
  State<AddTodo> createState() => AddTodoState(todo);
}

class AddTodoState extends State<AddTodo> {
  late String attGora;
  late bool done;

  late TextEditingController textEditingController;

  AddTodoState(TodoItem sak) {
    this.attGora = sak.attGora;
    this.done = sak.done;

    textEditingController = TextEditingController(text: sak.attGora);

    textEditingController.addListener(() {
      setState(() {
        attGora = textEditingController.text;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lägg till TODO"), actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(
                    context, TodoItem(attGora: attGora, done: done, id: "id"));
              },
              child: Text(
                "ADD",
                style: TextStyle(color: Colors.white),
              ))
        ]),
        body: Center(
          child: Container(
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Lägg till en ny aktivitet',
                      contentPadding: EdgeInsets.only(left: 20)),
                  controller: textEditingController,
                ),
              )),
        ));
  }
}
