import 'package:flutter/material.dart';
import 'package:workout_tracker/components/workout_tile.dart';
import 'package:workout_tracker/objects/workout.dart';
import 'package:workout_tracker/pages/add_workout.dart';

class Workouts extends StatefulWidget {
  final List<Workout> workoutsList;

  Workouts({super.key, required this.workoutsList});

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  void addWorkout() {
    Navigator.pushNamed(context, '/stats');
  }

  void saveWorkout(title, length, date, description, type) {
    setState(() {
      widget.workoutsList.add(Workout(title, length, date, description, type));
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddWorkout(saveWorkout: saveWorkout)));
        },
        label: const Row(
          children: [
            Icon(
              Icons.add,
              size: 28,
            ),
            Text("Add"),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: widget.workoutsList.length,
        itemBuilder: (context, index) => WorkoutTile(
          workout: widget.workoutsList[index],
        ),
      ),
    );
  }
}
