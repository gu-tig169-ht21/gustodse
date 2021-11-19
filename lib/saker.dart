import 'package:flutter/material.dart';

class MyTask {
  String text;
  bool klar;

  MyTask({
    required this.text,
    this.klar = false,
  });
}

class MyState extends ChangeNotifier {
  List<MyTask> _list = [];

  List<MyTask> get list => _list;

  String _filterBy = 'Alla';
  String get filterBy => _filterBy;

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  void addItem(String text) {
    _list.add(MyTask(text: text));
    notifyListeners();
  }

  void removeItem(int index) {
    _list.removeAt(index);
    notifyListeners();
  }

  void changeState(
    MyTask task,
  ) {
    task.klar = !task.klar;
    notifyListeners();
  }
}
