import 'package:hive/hive.dart';

part 'workout.g.dart';

@HiveType(typeId: 1)
enum WorkoutType {
  @HiveField(0)
  run,

  @HiveField(1)
  lift,

  @HiveField(2)
  bike,
}

@HiveType(typeId: 2)
class Workout {
  @HiveField(0)
  String title;

  @HiveField(1)
  double length;

  @HiveField(2)
  String date;

  @HiveField(3)
  String description;

  @HiveField(4)
  WorkoutType type;

  Workout(this.title, this.length, this.date, this.description, this.type);
}
