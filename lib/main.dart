import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:provider/provider.dart';
import './list_view.dart';

void main() {
  var state = MyState();

  state.fetchTodo();

  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sebbes app",
      home: ItemListView(),
    );
  }
}
