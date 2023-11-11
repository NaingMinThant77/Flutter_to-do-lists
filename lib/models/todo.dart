import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String title;
  String description;
  bool isCompleted;

  Todo({
    this.title = '',
    this.description = '',
  })  : id = const Uuid().v1(),
        isCompleted = false;
}
