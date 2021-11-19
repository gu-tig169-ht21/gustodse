import 'saker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToList extends StatefulWidget {
  final List<MyTask> list;

  ToList({required this.list});

  ToListState createState() => ToListState();
}

class ToListState extends State<ToList> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => item(context, widget.list[index], index),
      itemCount: widget.list.length,
    );
  }

  Widget item(context, MyTask item, index) {
    return ListTile(
        title: Text(
          item.text,
          style: textStyle(item.klar),
        ),
        leading: Checkbox(
          value: item.klar,
          onChanged: (bool? klar) {
            Provider.of<MyState>(context, listen: false).changeState(item);
          },
        ),
        trailing: IconButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false).removeItem(index);
          },
          icon: Icon(Icons.cancel),
        ));
  }
}

TextStyle textStyle(klar) {
  if (klar) {
    return TextStyle(fontSize: 24, decoration: TextDecoration.lineThrough);
  } else {
    return TextStyle(fontSize: 24);
  }
}
