import 'saker.dart';
import 'package:flutter/material.dart';
import 'second_view.dart';
import 'package:provider/provider.dart';
import './list.dart';

void main() {
  var state = MyState();

  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.blue),
        title: Text('TIG169 TODO',
            style: TextStyle(color: Colors.black, fontSize: 26)),
        actions: [
          PopupMenuButton(
              onSelected: (String value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Alla"),
                      value: "Alla",
                    ),
                    PopupMenuItem(
                      child: Text("Klara"),
                      value: "Klara",
                    ),
                    PopupMenuItem(
                      child: Text("Ej Klara"),
                      value: "ejKlara",
                    ),
                  ])
        ],
      ),
      body: Center(
        // fixa så listan syns
        child: ToList(
          list: context.watch<MyState>().list,
        ),
      ),
      floatingActionButton: _fab(context),
    );
  }

  List<MyTask> _filterList(list, filterBy) {
    if (filterBy == "Alla") return list;
    if (filterBy == "Klara")
      return list.where((sak) => sak.done == true).toList();
    if (filterBy == "ejKlara")
      return list.where((sak) => sak.done == false).toList();
    else
      return list;
  }
}

Widget _fab(context) {
  return FloatingActionButton(
    child: Icon(Icons.add, size: 56),
    backgroundColor: Colors.blue,
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondView()));
    },
  );
}
