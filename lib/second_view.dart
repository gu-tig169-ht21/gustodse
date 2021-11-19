import 'package:flutter/material.dart';
import 'saker.dart';
import 'package:provider/provider.dart';

class SecondView extends StatelessWidget {
  Widget build(context) {
    var controller = TextEditingController(text: '');
    return StatefulBuilder(
        builder: (context, setState) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                'TIG169 TODO',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
            body: Column(
              children: [
                Container(
                  height: 25,
                ),
                Container(
                  width: 325.0,
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Vad ska du gora?',
                          contentPadding: const EdgeInsets.only(left: 20)),
                      controller: controller),
                ),
                Container(
                  height: 25,
                ),
                RaisedButton(
                    child: Text('+ADD'),
                    onPressed: () {
                      Provider.of<MyState>(context, listen: false)
                          .addItem(controller.text);
                      Navigator.pop(
                        context,
                      );
                    }),
              ],
            )));
  }
}
