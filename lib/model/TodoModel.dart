
class TodoModel{

  late String title;
  late String description;
  late DateTime createdAt;
  late DateTime updatedAt;

  TodoModel({required this.title,required this.description,required this.updatedAt,required this.createdAt});

  @override
  String toString() {
    return 'TodoModel{title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  @override
  String toString() {
    return 'TodoModel{title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}