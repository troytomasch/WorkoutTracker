import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workout_tracker/objects/workout.dart';

class AddWorkout extends StatelessWidget {
  const AddWorkout({super.key});

  void saveActivity() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Workout"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {},
        label: Text("Save", style: TextStyle(fontSize: 30)),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
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
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: DropdownMenu(
                width: 350,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: WorkoutType.run, label: "Run"),
                  DropdownMenuEntry(value: WorkoutType.bike, label: "Bike"),
                  DropdownMenuEntry(value: WorkoutType.lift, label: "Lift")
                ],
                label: Text("Workout Type"),
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
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                    label: Text("Description"),
                    hintText: "Enter the desrciption here"),
              ),
            ),
          ],
        ),
      ),
    );
    // return const Column(children: [
    //   TextField(
    //     decoration: InputDecoration(label: Text("Title")),
    //   ),
    // ]);
  }
}
