// import 'package:flutter/material.dart';

// class AddTaskPage extends StatefulWidget {
//   final Function(int) onTaskCompleted;

//   AddTaskPage({required this.onTaskCompleted});

//   @override
//   _AddTaskPageState createState() => _AddTaskPageState();
// }

// class _AddTaskPageState extends State<AddTaskPage> {
//   final List<TaskItem> _tasks = [];
//   final TextEditingController _taskController = TextEditingController();
//   bool _isAddingTask = false;

//   void _addTask(String title) {
//     setState(() {
//       _tasks.add(TaskItem(
//         title: title,
//         date: DateTime.now().toString().substring(0, 10),
//         onCompleted: () {
//           widget.onTaskCompleted(DateTime.now().weekday);
//         },
//       ));
//       _isAddingTask = false;
//     });
//     _taskController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Task'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               CategoryChip(label: 'All'),
//               CategoryChip(label: 'Work'),
//               CategoryChip(label: 'Personal'),
//               CategoryChip(label: 'Wishlist'),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _tasks.length,
//               itemBuilder: (context, index) {
//                 return _tasks[index];
//               },
//             ),
//           ),
//           if (_isAddingTask)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 250, // Adjust the width here
//                     child: TextField(
//                       controller: _taskController,
//                       decoration: InputDecoration(
//                         hintText: 'Input new task here',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             Icons.arrow_forward,
//                             color: _taskController.text.isEmpty
//                                 ? Colors.grey
//                                 : Colors.blue,
//                           ),
//                           onPressed: _taskController.text.isEmpty
//                               ? null
//                               : () => _addTask(_taskController.text),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _isAddingTask = true;
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class CategoryChip extends StatelessWidget {
//   final String label;

//   CategoryChip({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(label),
//       backgroundColor: Colors.blue.shade100,
//     );
//   }
// }

// class TaskItem extends StatefulWidget {
//   final String title;
//   final String date;
//   final VoidCallback onCompleted;

//   TaskItem({required this.title, required this.date, required this.onCompleted});

//   @override
//   _TaskItemState createState() => _TaskItemState();
// }

// class _TaskItemState extends State<TaskItem> {
//   bool isStarred = false;
//   bool isCompleted = false;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Checkbox(
//         value: isCompleted,
//         onChanged: (bool? value) {
//           setState(() {
//             isCompleted = value ?? false;
//             if (isCompleted) {
//               widget.onCompleted();
//             }
//           });
//         },
//       ),
//       title: Text(
//         widget.title,
//         style: TextStyle(
//           decoration: isCompleted ? TextDecoration.lineThrough : null,
//           color: isCompleted ? Colors.grey : Colors.black,
//         ),
//       ),
//       subtitle: Text(widget.date, style: TextStyle(color: isCompleted ? Colors.grey : Colors.red)),
//       trailing: IconButton(
//         icon: Icon(
//           isStarred ? Icons.star : Icons.star_border,
//           color: isStarred ? Colors.amber : Colors.grey,
//         ),
//         onPressed: () {
//           setState(() {
//             isStarred = !isStarred;
//           });
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class AddTaskPage extends StatefulWidget {
//   final Function(int) onTaskCompleted;

//   AddTaskPage({required this.onTaskCompleted});

//   @override
//   _AddTaskPageState createState() => _AddTaskPageState();
// }

// class _AddTaskPageState extends State<AddTaskPage> {
//   final List<TaskItem> _tasks = [];
//   final TextEditingController _taskController = TextEditingController();
//   bool _isAddingTask = false;

//   void _addTask(String title) {
//     setState(() {
//       _tasks.add(TaskItem(
//         title: title,
//         date: DateTime.now().toString().substring(0, 10),
//         onCompleted: () {
//           widget.onTaskCompleted(DateTime.now().weekday);
//         },
//       ));
//       _isAddingTask = false;
//     });
//     _taskController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Task'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               CategoryChip(label: 'All'),
//               CategoryChip(label: 'Work'),
//               CategoryChip(label: 'Personal'),
//               CategoryChip(label: 'Wishlist'),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _tasks.length,
//               itemBuilder: (context, index) {
//                 return _tasks[index];
//               },
//             ),
//           ),
//           if (_isAddingTask)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 250, // Adjust the width here
//                     child: TextField(
//                       controller: _taskController,
//                       decoration: InputDecoration(
//                         hintText: 'Input new task here',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             Icons.arrow_forward,
//                             color: _taskController.text.isEmpty
//                                 ? Colors.grey
//                                 : Colors.blue,
//                           ),
//                           onPressed: _taskController.text.isEmpty
//                               ? null
//                               : () => _addTask(_taskController.text),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _isAddingTask = true;
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class CategoryChip extends StatelessWidget {
//   final String label;

//   CategoryChip({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(label),
//       backgroundColor: Colors.blue.shade100,
//     );
//   }
// }

// class TaskItem extends StatefulWidget {
//   final String title;
//   final String date;
//   final VoidCallback onCompleted;

//   TaskItem({required this.title, required this.date, required this.onCompleted});

//   @override
//   _TaskItemState createState() => _TaskItemState();
// }

// class _TaskItemState extends State<TaskItem> {
//   bool isStarred = false;
//   bool isCompleted = false;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Checkbox(
//         value: isCompleted,
//         onChanged: (bool? value) {
//           setState(() {
//             isCompleted = value ?? false;
//             if (isCompleted) {
//               widget.onCompleted();
//             }
//           });
//         },
//       ),
//       title: Text(
//         widget.title,
//         style: TextStyle(
//           decoration: isCompleted ? TextDecoration.lineThrough : null,
//           color: isCompleted ? Colors.grey : Colors.black,
//         ),
//       ),
//       subtitle: Text(widget.date, style: TextStyle(color: isCompleted ? Colors.grey : Colors.red)),
//       trailing: IconButton(
//         icon: Icon(
//           isStarred ? Icons.star : Icons.star_border,
//           color: isStarred ? Colors.amber : Colors.grey,
//         ),
//         onPressed: () {
//           setState(() {
//             isStarred = !isStarred;
//           });
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home.dart';

class AddTaskPage extends StatefulWidget {
  final List<TaskItem> tasks;
  final Function(bool) onTaskCompleted;
  final Function(String) addTask;

  AddTaskPage({
    required this.tasks,
    required this.onTaskCompleted,
    required this.addTask,
  });

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _taskController = TextEditingController();
  bool _isAddingTask = false;

  void _addTask(String title) {
    widget.addTask(title);
    _taskController.clear();
    setState(() {
      _isAddingTask = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryChip(label: 'All'),
              CategoryChip(label: 'Work'),
              CategoryChip(label: 'Personal'),
              CategoryChip(label: 'Wishlist'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.tasks.length,
              itemBuilder: (context, index) {
                return widget.tasks[index];
              },
            ),
          ),
          if (_isAddingTask)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250, // Adjust the width here
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: 'Input new task here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: _taskController.text.isEmpty
                                ? Colors.grey
                                : Colors.blue,
                          ),
                          onPressed: _taskController.text.isEmpty
                              ? null
                              : () => _addTask(_taskController.text),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isAddingTask = true;
          });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label,style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromARGB(255, 67, 164, 209),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: BorderSide(color: Colors.white)),
    );
  }
}