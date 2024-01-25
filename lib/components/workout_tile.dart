import 'package:flutter/material.dart';
import 'package:workout_tracker/objects/workout.dart';

class WorkoutTile extends StatelessWidget {
  final Workout workout;

  const WorkoutTile({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black26, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(workout.date),
              Icon(
                workout.type == WorkoutType.run
                    ? Icons.directions_run
                    : (workout.type == WorkoutType.bike
                        ? Icons.directions_bike
                        : Icons.fitness_center),
                color: Theme.of(context).primaryColor,
              )
            ]),
            Text(
              workout.title,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
