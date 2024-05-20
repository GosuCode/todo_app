import 'package:hive_flutter/hive_flutter.dart';

class TaskService {
  List todoTask = [];
  final _myBox = Hive.box('taskBox');

  //initial data when app opened first time ever
  void showInitialData() {
    todoTask = [
      ["Slide do delete the task", false],
      ["Have fun", false]
    ];
  }

  void showTask() {
    todoTask = _myBox.get("TODOTASK");
  }

  void updateTask() {
    _myBox.put("TODOTASK", todoTask);
  }
}
