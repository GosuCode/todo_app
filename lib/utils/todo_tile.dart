import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final bool isTaskCompleted;
  Function(bool?)? onChanged;
  final String taskName;
  Function(BuildContext)? deleteTask;
  TodoTile({
    super.key,
    required this.isTaskCompleted,
    required this.onChanged,
    required this.taskName,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
          )
        ]),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: isTaskCompleted ? Colors.black45 : Colors.white,
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    // spreadRadius: 5,
                    // blurRadius: 7,
                    offset: const Offset(5, 5))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              children: [
                Checkbox(
                  value: isTaskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.greenAccent[400],
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      color: isTaskCompleted ? Colors.white : Colors.black,
                      decoration: isTaskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
