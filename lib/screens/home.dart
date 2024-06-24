// import 'package:flutter/material.dart';
// import 'package:flutter_project/screens/add_task.dart';
// import 'package:flutter_project/screens/mine.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();
//   final List<Map<String, dynamic>> _taskCompletionData = List.generate(
//     7,
//     (index) => {'day': DateTime.now().subtract(Duration(days: index)).weekday, 'tasks': 0},
//   );

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.jumpToPage(index);
//   }

//   void _updateTaskCompletion(int day) {
//     setState(() {
//       _taskCompletionData.firstWhere((data) => data['day'] == day)['tasks']++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         children: [
//           Center(child: Text('Menu Page')), // Placeholder for Menu Page
//           AddTaskPage(onTaskCompleted: _updateTaskCompletion),
//           Center(child: Text('Calendar Page')), // Placeholder for Calendar Page
//           MinePage(taskCompletionData: _taskCompletionData),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.lightBlue[100], // Baby blue background color
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Menu',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Tasks',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Calendar',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Mine',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_project/screens/add_task.dart';
// import 'package:flutter_project/screens/mine.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 1; // Set default to AddTaskPage
//   final PageController _pageController = PageController(initialPage: 1);
//   final List<Map<String, dynamic>> _taskCompletionData = List.generate(
//     7,
//     (index) => {'day': DateTime.now().subtract(Duration(days: index)).weekday, 'tasks': 0},
//   );

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.jumpToPage(index);
//   }

//   void _updateTaskCompletion(int day) {
//     setState(() {
//       _taskCompletionData.firstWhere((data) => data['day'] == day)['tasks']++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         children: [
//           Center(child: Text('Menu Page')), // Placeholder for Menu Page
//           AddTaskPage(onTaskCompleted: _updateTaskCompletion),
//           Center(child: Text('Calendar Page')), // Placeholder for Calendar Page
//           MinePage(taskCompletionData: _taskCompletionData),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.lightBlueAccent[100], // Light blue background color
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Menu',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Tasks',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Calendar',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Mine',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }  

import 'package:flutter/material.dart';
import 'package:flutter_project/screens/add_task.dart';
import 'package:flutter_project/screens/calender.dart';
import 'package:flutter_project/screens/menu_slider.dart';
import 'package:flutter_project/screens/mine.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Set default to AddTaskPage
  final PageController _pageController = PageController(initialPage: 1);
  final List<Map<String, dynamic>> _taskCompletionData = List.generate(
    7,
    (index) => {'day': index + 1, 'tasks': 0},
  );
  final List<TaskItem> _tasks = [];
  bool _isMenuOpen = false;

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _isMenuOpen = !_isMenuOpen;
      });
    } else {
      setState(() {
        _selectedIndex = index;
        _pageController.jumpToPage(index - 1);
      });
    }
  }

  void _updateTaskCompletion(DateTime date, bool isCompleted) {
    setState(() {
      var taskData = _taskCompletionData.firstWhere((data) => data['day'] == date.weekday);
      if (isCompleted) {
        taskData['tasks']++;
      } else {
        taskData['tasks']--;
      }
    });
  }

  void _addTask(String title) {
    setState(() {
      _tasks.add(TaskItem(
        title: title,
        date: DateTime.now().toString().substring(0, 10),
        onCompleted: (isCompleted) {
          _updateTaskCompletion(DateTime.now(), isCompleted);
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Task Manager', style: TextStyle(color: Colors.white),)),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     setState(() {
        //       _isMenuOpen = !_isMenuOpen;
        //     });
        //   },
        // ),
        backgroundColor: Color.fromARGB(255, 67, 164, 209),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index + 1;
              });
            },
            children: [
              AddTaskPage(
                tasks: _tasks,
                onTaskCompleted: (isCompleted) {
                  _updateTaskCompletion(DateTime.now(), isCompleted);
                },
                addTask: _addTask,
              ),
              CalendarPage(tasks: _tasks), 
              MinePage(taskCompletionData: _taskCompletionData),
            ],
          ),
          MenuSlider(isMenuOpen: _isMenuOpen), 
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 149, 186, 216), 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mine',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class TaskItem extends StatefulWidget {
  final String title;
  final String date;
  final Function(bool) onCompleted;
  bool isCompleted;

  TaskItem({
    required this.title,
    required this.date,
    required this.onCompleted,
    this.isCompleted = false,
  });

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.isCompleted,
        onChanged: (bool? value) {
          setState(() {
            widget.isCompleted = value ?? false;
            widget.onCompleted(widget.isCompleted);
          });
        },
        checkColor: Colors.white,
        activeColor: Color.fromARGB(255, 84, 195, 178),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          decoration: widget.isCompleted ? TextDecoration.lineThrough : null,
          color: widget.isCompleted ? Colors.grey : Colors.black,
        ),
      ),
      subtitle: Text(widget.date, style: TextStyle(color: widget.isCompleted ? Colors.grey : const Color.fromARGB(255, 84, 195, 17))),
      trailing: IconButton(
        icon: Icon(
          isStarred ? Icons.star : Icons.star_border,
          color: isStarred ? Colors.amber : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            isStarred = !isStarred;
          });
        },
      ),
    );
  }
}