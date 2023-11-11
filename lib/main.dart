import 'package:flutter/material.dart';
import 'package:todo_list/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo_List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<Todo> todos = [];
//   final _formKey = GlobalKey<FormState>();
//   late String description;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Todo App"),
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (context) {
//                   return TodoForm(
//                     type: "update",
//                     todo: todos[index],
//                     updateCallback: (newDescription) {
//                       setState(() {
//                         todos[index].description = newDescription;
//                       });
//                     },
//                     addCallback: (newTodo) {},
//                   );
//                 },
//               );
//             },
//             leading: Checkbox(
//               value: todos[index].isCompleted,
//               onChanged: (value) {
//                 setState(() {
//                   todos[index].isCompleted = !todos[index].isCompleted;
//                 });
//               },
//             ),
//             title: Text(todos[index].description),
//             trailing: IconButton(
//               onPressed: () {
//                 setState(() {
//                   todos.removeAt(index);
//                 });
//               },
//               icon: Icon(Icons.delete),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return TodoForm(
//                 type: "new",
//                 updateCallback: (newDescription) {},
//                 addCallback: (newTodo) {
//                   setState(() {
//                     todos.add(newTodo);
//                   });
//                 },
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class Todo {
//   String id;
//   String description;
//   bool isCompleted;

//   Todo({
//     this.description = '',
//   })  : id = Uuid().v1(),
//         isCompleted = false;
// }

// class TodoForm extends StatefulWidget {
//   final String type;
//   final Todo? todo;
//   final Function(String) updateCallback;
//   final Function(Todo) addCallback;

//   TodoForm({
//     Key? key,
//     required this.type,
//     this.todo,
//     required this.updateCallback,
//     required this.addCallback,
//   }) : super(key: key);

//   @override
//   _TodoFormState createState() => _TodoFormState();
// }

// class _TodoFormState extends State<TodoForm> {
//   final _formKey = GlobalKey<FormState>();
//   late String description;

//   @override
//   void initState() {
//     super.initState();
//     description = widget.todo?.description ?? '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: double.infinity, //auto adjuct height
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                 //   TextField(
//                 //     decoration: InputDecoration(
//                 //       labelText: "Title",
//                 //       hintText: "Title",
//                 //     ),
//                 //     controller: TextEditingController(text: description),
//                 //     onChanged: (value) => description = value ?? '',
//                 //   ),
//                   TextFormField(
//                     initialValue: description,
//                     onSaved: (value) => description = value ?? '',
//                     decoration: InputDecoration(
//                       hintText: "Title",
//                     ),
//                   ),
//                   TextFormField(
//                     initialValue: description,
//                     onSaved: (value) => description = value ?? '',
//                     decoration: InputDecoration(
//                       hintText: "Write Note Here",
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     children: [
//                       const Spacer(),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("Cancel")),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(primary: Colors.blue),
//                         onPressed: () {
//                           _formKey.currentState!.save();
//                           if (widget.type == "new") {
//                             widget.addCallback(Todo(description: description));
//                           } else {
//                             widget.updateCallback(description);
//                           }
//                           Navigator.of(context).pop();
//                         },
//                         child: Text(
//                           widget.todo != null ? "Update" : "Add",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
