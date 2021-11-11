import 'dart:ui';

import 'package:flutter/material.dart';

Widget item(String attGora, bool done) {
  return ListTile(
      leading: Checkbox(
        value: done,
        onChanged: (val) {},
      ),
      title: Text(
        attGora,
        style: _textStyle(done),
      ),
      trailing: Icon(Icons.delete));
}

TextStyle _textStyle(done) {
  if (done) {
    return TextStyle(
      fontSize: 24,
      decoration: TextDecoration.lineThrough,
    );
  } else {
    return TextStyle(fontSize: 24);
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIG169 TODO'),
      ),
      body: list(),
    );
  }
}

Widget list() {
  return ListView(
    children: [
      nameInputField(),
      addRow(),
    ],
  );
}

Widget addRow() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(left: 80, right: 80),
      ),
      Icon(Icons.add),
      Text(
        'Add',
      ),
    ],
  );
}

Widget nameInputField() {
  return Container(
    margin: EdgeInsets.all(50),
    height: 50,
    child: TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: 'What are you going to do?'),
    ),
  );
}
