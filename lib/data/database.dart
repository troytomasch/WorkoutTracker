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

  void loadData() {
    workoutsList = _workoutBox.get("workoutdata");
  }

  void updateData() {
    _workoutBox.put("workoutdata", workoutsList);
  }
}
