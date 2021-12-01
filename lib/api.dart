import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:min_app/todo.dart';
import 'package:http/http.dart' as http;

const API_URL = "https://todoapp-api-pyq5q.ondigitalocean.app";
const API_KEY = "4caa71f9-49b3-4064-b706-a476e798daa8";

class Api {
  static Future<List<TodoItem>> fetchTodo() async {
    http.Response response =
        await http.get(Uri.parse("$API_URL/todos?key=$API_KEY"));
    print(response.body);
    var json = jsonDecode(response.body);
    return json.map<TodoItem>((data) {
      return TodoItem.fromJson(data);
    }).toList();
  }

  static Future addTodo(TodoItem sak) async {
    var json = jsonEncode(TodoItem.toJson(sak));
    print(json);
    await http.post(
      Uri.parse("$API_URL/todos?key=$API_KEY"),
      body: json,
      headers: {"Content-Type": "application/json"},
    );
  }

  static Future updateTodos(TodoItem sak, String id) async {
    var json = jsonEncode(TodoItem.toJson(sak));
    print(json);
    await http.put(Uri.parse("$API_URL/todos/$id?key=$API_KEY"),
        body: json, headers: {"Content-Type": "application/json"});
  }

  static Future deleteTodos(String id) async {
    await http.delete(Uri.parse("$API_URL/todos/$id?key=$API_KEY"));
  }
}
