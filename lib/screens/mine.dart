// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class MinePage extends StatelessWidget {
//   final List<Map<String, dynamic>> taskCompletionData;

//   MinePage({required this.taskCompletionData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mine'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Add your sign-in logic here
//               },
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     child: Icon(Icons.person),
//                   ),
//                   SizedBox(width: 16),
//                   Text('Tap to sign in'),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Text('Tasks Overview'),
//             SizedBox(height: 10),
//             Expanded(
//               child: _buildTaskCompletionChart(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTaskCompletionChart() {
//     List<charts.Series<TaskCompletionData, String>> series = [
//       charts.Series(
//         id: 'TaskCompletion',
//         domainFn: (TaskCompletionData data, _) => data.day,
//         measureFn: (TaskCompletionData data, _) => data.tasks,
//         data: taskCompletionData.map((data) {
//           return TaskCompletionData(
//             day: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][data['day'] - 1],
//             tasks: data['tasks'],
//           );
//         }).toList(),
//       ),
//     ];

//     return charts.BarChart(
//       series,
//       animate: true,
//     );
//   }
// }

// class TaskCompletionData {
//   final String day;
//   final int tasks;

//   TaskCompletionData({required this.day, required this.tasks});
// }


// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class MinePage extends StatelessWidget {
//   final List<Map<String, dynamic>> taskCompletionData;

//   MinePage({required this.taskCompletionData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mine'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Add your sign-in logic here
//               },
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     child: Icon(Icons.person),
//                   ),
//                   SizedBox(width: 16),
//                   Text('Tap to sign in'),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Text('Tasks Overview'),
//             SizedBox(height: 10),
//             Expanded(
//               child: _buildTaskCompletionChart(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTaskCompletionChart() {
//     List<charts.Series<TaskCompletionData, String>> series = [
//       charts.Series(
//         id: 'TaskCompletion',
//         domainFn: (TaskCompletionData data, _) => data.day,
//         measureFn: (TaskCompletionData data, _) => data.tasks,
//         data: taskCompletionData.map((data) {
//           return TaskCompletionData(
//             day: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][data['day'] - 1],
//             tasks: data['tasks'],
//           );
//         }).toList(),
//         labelAccessorFn: (TaskCompletionData data, _) => '${data.tasks}',
//       ),
//     ];

//     return charts.BarChart(
//       series,
//       animate: true,
//       vertical: false,
//       barRendererDecorator: charts.BarLabelDecorator<String>(),
//       domainAxis: charts.OrdinalAxisSpec(),
//       primaryMeasureAxis: charts.NumericAxisSpec(
//         tickProviderSpec: charts.BasicNumericTickProviderSpec(
//           desiredTickCount: 11,
//         ),
//       ),
//     );
//   }
// }

// class TaskCompletionData {
//   final String day;
//   final int tasks;

//   TaskCompletionData({required this.day, required this.tasks});
// }


import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MinePage extends StatelessWidget {
  final List<Map<String, dynamic>> taskCompletionData;

  MinePage({required this.taskCompletionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Add your sign-in logic here
              },
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 138, 202, 234),
                    child: Icon(Icons.person, color: Colors.blue),
                  ),
                  SizedBox(width: 16),
                  Text('Tap to sign in'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Tasks Overview'),
            SizedBox(height: 10),
            Expanded(
              child: _buildTaskCompletionChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCompletionChart() {
    List<charts.Series<TaskCompletionData, String>> series = [
      charts.Series(
        id: 'TaskCompletion',
        domainFn: (TaskCompletionData data, _) => data.day,
        measureFn: (TaskCompletionData data, _) => data.tasks,
        data: taskCompletionData.map((data) {
          return TaskCompletionData(
            day: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat','Sun'][data['day'] -1],
            tasks: data['tasks'],
          );
        }).toList(),
        labelAccessorFn: (TaskCompletionData data, _) => '${data.tasks}',
      ),
    ];

    return charts.BarChart(
      series,
      animate: true,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(),
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          desiredTickCount: 11,
        ),
      ),
    );
  }
}

class TaskCompletionData {
  final String day;
  final int tasks;

  TaskCompletionData({required this.day, required this.tasks});
}