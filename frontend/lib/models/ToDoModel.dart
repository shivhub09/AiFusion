class TodoItem {
  final String description;
  final bool completed;
  final String id;

  const TodoItem({
    required this.description,
    required this.completed,
    required this.id,
  });

  // You can add additional methods here for manipulating the TodoItem
  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      description: json['description'],
      completed: json['completed'],
      id: json['_id'],
    );
  }
}
