import 'package:app_front/models/classes/task.dart';
import 'package:flutter/material.dart';
import 'package:app_front/models/global.dart';
import 'package:app_front/models/widgets/intray_wiget_todo.dart';

class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<Task> taskList = [];
  @override
  Widget build(BuildContext context) {
    taskList = _getList();
    return Container(
      color: darkGreyColor,
      child: _buildRecorderableListSimple(context),
    );
  }

  Widget _buildListTile(BuildContext context,Task item,) {
    return ListTile(
      
      key: Key(item.taskId),
      title: IntrayTodo(
        title: item.title,
      ),
    );
  }

  Widget _buildRecorderableListSimple(BuildContext context) {
    return Theme(
       data: ThemeData(canvasColor: Colors.transparent),
          child: ReorderableListView(
          padding: EdgeInsets.only(top: 300),
          children: taskList
              .map((Task item) => _buildListTile(
                    context,
                    item,
                  ))
              .toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              Task item = taskList[oldIndex];
              taskList.remove(item);
              taskList.insert(newIndex, item);
            });
          }),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  List<Task> _getList() {
    for (int i = 0; i < 10; i++) {
      taskList.add(Task("My First todo" + i.toString(), false, i.toString()));
    }
    return taskList;
  }
}
