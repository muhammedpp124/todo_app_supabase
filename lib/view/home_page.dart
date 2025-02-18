import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/todo_provider.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context); 

    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      body: FutureBuilder(
        future: todoProvider.loadTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              final todo = todoProvider.todos[index];
              return ListTile(
                title: Text(todo.title),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) => todoProvider.toggleTodoStatus(todo.id, value!),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => todoProvider.removeTodo(todo.id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
