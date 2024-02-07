import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/components/workout_tile.dart';
import 'package:workout_tracker/data/database.dart';
import 'package:workout_tracker/main.dart';
import 'package:workout_tracker/objects/workout.dart';
import 'package:workout_tracker/pages/add_workout.dart';

class Workouts extends ConsumerStatefulWidget {
  Workouts({super.key});

  @override
  _WorkoutsState createState() => _WorkoutsState();
}

class _WorkoutsState extends ConsumerState<Workouts> {
  void addWorkout() {
    Navigator.pushNamed(context, '/stats');
  }

  void saveWorkout(title, length, date, description, type) {
    setState(() {
      ref
          .read(localDatabaseProvider)
          .addToList(title, length, date, description, type);
    });

    ref.read(localDatabaseProvider).updateData();
    Navigator.pop(context);
  }

  void deleteWorkout(id) {
    setState(() {
      ref.read(localDatabaseProvider).deleteWorkout(id);
      ref.read(localDatabaseProvider).updateData();
    });

    Navigator.of(context).pop();
  }

  final workoutBox = Hive.box("workoutApp");

  @override
  void initState() {
    if (workoutBox.get("WORKOUTDATA") != null) {
      ref.read(localDatabaseProvider).loadData();
    } else {
      ref.read(localDatabaseProvider).createSampleData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final workoutList = ref.watch(localDatabaseProvider).workoutsList;

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
        itemCount: workoutList.length,
        itemBuilder: (context, index) => WorkoutTile(
          workout: workoutList[index],
          deleteWorkout: deleteWorkout,
        ),
      ),
    );
  }
}
