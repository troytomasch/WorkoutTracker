import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workout_tracker/components/button.dart';
import 'package:workout_tracker/objects/workout.dart';

class AddWorkout extends StatelessWidget {
  final void Function(String title, double length, String date,
      String description, WorkoutType? type) saveWorkout;

  AddWorkout({super.key, required this.saveWorkout});

  void submitWorkout() {
    if (title.text != "" &&
        length.text != "" &&
        date.text != "" &&
        description.text != "" &&
        selectedType != null) {
      saveWorkout(title.text, double.parse(length.text), date.text,
          description.text, selectedType);
    }
  }

  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController length = TextEditingController();
  WorkoutType? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Workout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: title,
                decoration: const InputDecoration(
                    label: Text("Title"), hintText: "Enter your title here"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  label: Text("Date"),
                  hintText: "Enter the date here",
                ),
                selectionHeightStyle: BoxHeightStyle.max,
                controller: date,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: DropdownMenu(
                width: 350,
                menuStyle: MenuStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.surface)),
                onSelected: ((value) {
                  selectedType = value;
                }),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: WorkoutType.run, label: "Run"),
                  DropdownMenuEntry(value: WorkoutType.bike, label: "Bike"),
                  DropdownMenuEntry(
                    value: WorkoutType.lift,
                    label: "Lift",
                  )
                ],
                label: const Text("Workout Type"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text("Length"),
                    hintText: "Enter the length of the workout here"),
                selectionHeightStyle: BoxHeightStyle.max,
                controller: length,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: description,
                decoration: InputDecoration(
                    label: Text("Description"),
                    hintText: "Enter the desrciption here"),
              ),
            ),
            MyButton(
              text: "Save",
              onPressed: submitWorkout,
            )
          ],
        ),
      ),
    );
  }
}
