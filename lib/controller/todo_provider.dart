import 'package:flutter/material.dart';
import 'package:todo2/model/todo_model.dart';
import 'package:todo2/service/subabase_service.dart';
import '../model/todo_model.dart';
import '../service/subabase_service.dart';

class TodoProvider with ChangeNotifier {
  final SupabaseService _service = SupabaseService();
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> loadTodos() async {
    _todos = await _service.fetchTodos();
    notifyListeners();
  }

  Future<void> addTodo(String title) async {
    await _service.addTodo(title);
    await loadTodos();
  }

  Future<void> toggleTodoStatus(String id, bool isCompleted) async {
    await _service.updateTodo(id, isCompleted);
    await loadTodos();
  }

  Future<void> removeTodo(String id) async {
    await _service.deleteTodo(id);
    await loadTodos();
  }
}
