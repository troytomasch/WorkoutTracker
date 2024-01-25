import 'package:flutter/material.dart';
import 'package:workout_tracker/components/workout_tile.dart';
import 'package:workout_tracker/objects/workout.dart';

class Workouts extends StatefulWidget {
  Workouts({super.key});

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  List<Workout> workoutsList = [
    Workout("Easy Run", 1, "1/24/2024", "Chilling.", WorkoutType.run),
    Workout("Weight Lifting", 0.5, "1/24/2024", "All squats, all the time.",
        WorkoutType.lift),
    Workout("Long Bike", 2, "1/20/2024", "Went for a long bike ride.",
        WorkoutType.bike)
  ];

  void addWorkout() {
    Navigator.pushNamed(context, '/stats');
    // workoutsList.add(Workout(title, length, date, description, type));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.pushNamed(context, '/add');
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
        itemCount: workoutsList.length,
        itemBuilder: (context, index) => WorkoutTile(
          workout: workoutsList[index],
        ),
      ),
    );
  }
}
