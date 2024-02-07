import 'package:flutter/material.dart';

class DeleteWorkout extends StatelessWidget {
  const DeleteWorkout({super.key, required this.cancel, required this.delete});
  final VoidCallback cancel;
  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 24, top: 12, right: 12, left: 12),
            child: Text("Are you sure you want to delete this activity?"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Theme.of(context).colorScheme.secondary)),
                  onPressed: delete,
                  child: Text(
                    "Yes",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
              ElevatedButton(
                onPressed: cancel,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Theme.of(context).colorScheme.secondary)),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
