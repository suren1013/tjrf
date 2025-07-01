import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DayPlannerPage(),
    );
  }
}

class DayPlannerPage extends StatefulWidget {
  @override
  _DayPlannerPageState createState() => _DayPlannerPageState();
}

class _DayPlannerPageState extends State<DayPlannerPage> {
  final _taskController = TextEditingController();
  final List<String> _tasks = [];

  void _addTask() {
    final text = _taskController.text;
    if (text.isNotEmpty) {
      setState(() {
        _tasks.add(text);
        _taskController.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Day Planner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Enter task'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTask,
              child: Text('Add Task'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(_tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeTask(index),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
