class Todo {
  final String id;
  final String title;
  final bool isCompleted;

  Todo({required this.id, required this.title, this.isCompleted = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isCompleted: json['is_completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'is_completed': isCompleted,
    };
  }
}
