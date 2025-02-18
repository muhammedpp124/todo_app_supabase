import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/todo_provider.dart'; 
import 'package:go_router/go_router.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Add")
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            TextField(controller: _controller, decoration: InputDecoration(labelText: "Type..")),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  todoProvider.addTodo(_controller.text);
                  context.pop(); 
                }
              },
              child: Text("SAVE"),
            ),
          ],
        ),
      ),
    );
  }
}
