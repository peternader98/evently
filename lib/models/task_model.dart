class TaskModel {
  String id;
  String category;
  String title;
  String description;
  int date;
  String time;

  TaskModel({
    this.id = '',
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
    : this(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
    );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
    };
  }
}
