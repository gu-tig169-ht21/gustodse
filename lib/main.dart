import 'package:flutter/material.dart';
import 'package:min_app/saker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIG169 TODO'),
        actions: [IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
          }),
      body: Column(
        children: [
          item("Write a book!", false),
          const Divider(),
          item("Do homework", false),
          const Divider(),
          item('Tidy room', true),
          const Divider(),
          item('Watch TV', false),
          const Divider(),
          item('Nap', false),
          const Divider(),
          item('Shop groceries', false),
          const Divider(),
          item('Have fun', false),
          const Divider(),
          item('Meditate', false),
          const Divider(),
        ],
      ),
    );
  }
}
