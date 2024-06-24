import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPage extends StatefulWidget {
  final List<TaskItem> tasks;

  CalendarPage({required this.tasks});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Map<DateTime, List<TaskItem>> _events;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _events = {};
    _initEvents();
  }

  void _initEvents() {
    for (var task in widget.tasks) {
      DateTime taskDate = DateTime.parse(task.date);
      DateTime normalizedDate = DateTime(taskDate.year, taskDate.month, taskDate.day);
      if (_events.containsKey(normalizedDate)) {
        _events[normalizedDate]!.add(task);
      } else {
        _events[normalizedDate] = [task];
      }
    }
    // Debugging statement
    _events.forEach((key, value) {
      print('$key: ${value.length} tasks');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        eventLoader: (day) {
          DateTime normalizedDay = DateTime(day.year, day.month, day.day);
          return _events[normalizedDay] ?? [];
        },
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, tasks) {
            print('Marker builder called for $date with ${tasks.length} tasks');
            if (tasks.isEmpty) return SizedBox();
            var taskItems = tasks.cast<TaskItem>();
            bool allCompleted = taskItems.every((task) => task.isCompleted);
            bool noneCompleted = taskItems.every((task) => !task.isCompleted);

            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(2.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: allCompleted
                      ? Colors.green
                      : noneCompleted
                          ? Colors.red
                          : Colors.orange,
                ),
              ),
            );
          },
          todayBuilder: (context, date, _) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}