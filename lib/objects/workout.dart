enum WorkoutType {
  run,
  lift,
  bike,
}

class Workout {
  String title;
  double length;
  String date;
  String description;
  WorkoutType type;

  Workout(this.title, this.length, this.date, this.description, this.type);
}
