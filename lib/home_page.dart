import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/service/task_service.dart';
import 'package:todo_app/utils/dialogue_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('taskBox');

  TaskService db = TaskService();
  final textController = TextEditingController();

  void addNewTask() {
    setState(() {
      db.todoTask.add([textController.text, false]);
      textController.clear();
      Navigator.of(context).pop();
    });
    db.updateTask();
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
              controller: textController,
              onSave: addNewTask,
              onCancel: Navigator.of(context).pop);
        });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoTask[index][1] = !db.todoTask[index][1];
    });
    db.updateTask();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoTask.removeAt(index);
    });
    db.updateTask();
  }

  @override
  void initState() {
    if (_myBox.get("TODOTASK") == null) {
      db.showInitialData();
    } else {
      db.showTask();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo",
          style: GoogleFonts.teko(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.8,
              child: ListView.builder(
                  itemCount: db.todoTask.length,
                  itemBuilder: (context, index) {
                    return TodoTile(
                        isTaskCompleted: db.todoTask[index][1],
                        onChanged: (value) {
                          checkBoxChanged(value, index);
                        },
                        taskName: db.todoTask[index][0],
                        deleteTask: (context) => deleteTask(index));
                  }),
            ),
            Container(
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, offset: Offset(5, 5))
                  ],
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              child: FloatingActionButton(
                onPressed: addTask,
                backgroundColor: Colors.greenAccent[400],
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
