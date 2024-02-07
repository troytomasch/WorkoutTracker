import 'package:flutter/material.dart';
import 'package:workout_tracker/objects/workout.dart';

class ShowWorkout extends StatelessWidget {
  ShowWorkout({super.key, required this.workout});
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Workout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  workout.title,
                  style: TextStyle(fontSize: 36),
                ),
                Icon(
                  workout.type == WorkoutType.run
                      ? Icons.directions_run
                      : (workout.type == WorkoutType.bike
                          ? Icons.directions_bike
                          : Icons.fitness_center),
                  size: 36,
                ),
              ],
            ),
            Text(
              "Date: " + workout.date,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Length: " + workout.length.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text("Description: \n" + workout.description)
          ],
        )),
      ),
    );
  }
}
