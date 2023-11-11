import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/screens/todo_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> todos = [
     Todo(title: "English", description: "Writing essay 'animals'"),
    Todo(title: "Science", description: "Presentation 'AI'"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return TodoForm(
                    type: "update",
                    todo: todos[index],
                    updateCallback: (newTitle, newDescription) {
                      setState(() {
                        todos[index].title = newTitle;
                        todos[index].description = newDescription;
                      });
                    },
                    addCallback: (newTodo) {},
                  );
                },
              );
            },
            leading: Checkbox(
              value: todos[index].isCompleted,
              onChanged: (value) {
                setState(() {
                  todos[index].isCompleted = !todos[index].isCompleted;
                });
              },
            ),
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  todos.removeAt(index);
                });
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return TodoForm(
                type: "new",
                updateCallback: (newTitle, newDescription) {},
                addCallback: (newTodo) {
                  setState(() {
                    todos.add(newTodo);
                  });
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
