import 'package:hive_flutter/hive_flutter.dart';

import '../objects/workout.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class WorkoutDataBase {
  List<Workout> workoutsList = [];

  final _workoutBox = Hive.box("workoutApp");

  void createSampleData() {
    workoutsList = [
      Workout("Easy Run", 1, "1/25/2024", "Chilling.", WorkoutType.run,
          "sampleData"),
    ];
  }

  void addToList(String title, double length, String date, String description,
      WorkoutType type) {
    workoutsList = [
      ...workoutsList,
      Workout(title, length, date, description, type, uuid.v1())
    ];
  }

  void loadData() {
    var workouts = _workoutBox.get("WORKOUTDATA");
    workoutsList = [];
    for (final workout in workouts) {
      workoutsList.add(Workout(workout.title, workout.length, workout.date,
          workout.description, workout.type, uuid.v1()));
    }
  }

  void deleteWorkout(String id) {
    List<Workout> newList = [];
    for (final workout in workoutsList) {
      if (workout.id != id) {
        newList.add(workout);
      }
    }
    workoutsList = newList;
  }

  void updateData() {
    _workoutBox.put("WORKOUTDATA", workoutsList);
  }
}
