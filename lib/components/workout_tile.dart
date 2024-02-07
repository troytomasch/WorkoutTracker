import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_tracker/components/delete_workout.dart';
import 'package:workout_tracker/main.dart';
import 'package:workout_tracker/objects/workout.dart';
import 'package:workout_tracker/pages/show_workout.dart';

class WorkoutTile extends ConsumerStatefulWidget {
  final Workout workout;
  final Function(String id) deleteWorkout;

  const WorkoutTile(
      {super.key, required this.workout, required this.deleteWorkout});

  @override
  _WorkoutTileState createState() => _WorkoutTileState();
}

class _WorkoutTileState extends ConsumerState<WorkoutTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowWorkout(
                        workout: widget.workout,
                      )));
        },
        onLongPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeleteWorkout(
                        cancel: () {
                          Navigator.of(context).pop();
                        },
                        delete: () {
                          widget.deleteWorkout(widget.workout.id);
                        },
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(widget.workout.date),
                Icon(
                  widget.workout.type == WorkoutType.run
                      ? Icons.directions_run
                      : (widget.workout.type == WorkoutType.bike
                          ? Icons.directions_bike
                          : Icons.fitness_center),
                  color: Theme.of(context).splashColor,
                )
              ]),
              Text(
                widget.workout.title,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
