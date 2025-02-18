import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo2/model/todo_model.dart';
import '../model/todo_model.dart';

class SupabaseService {
  final _supabase = Supabase.instance.client;

  Future<List<Todo>> fetchTodos() async {
    final response = await _supabase.from('todos').select();



     if (response == null || response.isEmpty) {
      throw Exception("No data found or incorrect table name!");
    }

    return response.map((todo) => Todo.fromJson(todo)).toList();
  }
  
  
  Future<void> addTodo(String title) async {
    await _supabase.from('todos').insert({'title': title, 'is_completed': false});
  }

  Future<void> updateTodo(String id, bool isCompleted) async {
    await _supabase.from('todos').update({'is_completed': isCompleted}).match({'id': id});
  }

  Future<void> deleteTodo(String id) async {
    await _supabase.from('todos').delete().match({'id': id});
  }
}
