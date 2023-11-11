import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class TodoForm extends StatefulWidget {
  final String type;
  final Todo? todo;
  final Function(String, String) updateCallback;
  final Function(Todo) addCallback;

  const TodoForm({
    Key? key,
    required this.type,
    this.todo,
    required this.updateCallback,
    required this.addCallback,
  }) : super(key: key);

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.todo?.title ?? '';
    description = widget.todo?.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity, // Auto adjust height
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: title,
                  onSaved: (value) => title = value ?? '',
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                ),
                TextFormField(
                  initialValue: description,
                  onSaved: (value) => description = value ?? '',
                  decoration: const InputDecoration(
                    hintText: "Write Note Here",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (widget.type == "new") {
                          widget.addCallback(
                            Todo(
                              title: title,
                              description: description,
                            ),
                          );
                        } else {
                          widget.updateCallback(title, description);
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        widget.todo != null ? "Update" : "Add",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
