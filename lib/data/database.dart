import 'package:hive_flutter/hive_flutter.dart';

import '../objects/workout.dart';

class WorkoutDataBase {
  List<Workout> workoutsList = [];

  final _workoutBox = Hive.box("workoutApp");

  void createSampleData() {
    workoutsList = [
      Workout("Easy Run", 1, "1/25/2024", "Chilling.", WorkoutType.run),
    ];
  }

  void addToList(Workout workout) {
    workoutsList = [...workoutsList, workout];
  }

  void loadData() {
    var workouts = _workoutBox.get("WORKOUTDATA");
    workoutsList = [];
    for (final workout in workouts) {
      workoutsList.add(Workout(workout.title, workout.length, workout.date,
          workout.description, workout.type));
    }
  }

  void updateData() {
    _workoutBox.put("WORKOUTDATA", workoutsList);
  }
}
