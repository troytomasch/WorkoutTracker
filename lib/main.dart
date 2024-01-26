import 'package:flutter/material.dart';
import 'package:workout_tracker/data/database.dart';
import 'package:workout_tracker/pages/stats.dart';
import 'package:workout_tracker/pages/workouts.dart';
import 'package:workout_tracker/objects/workout.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(WorkoutAdapter());
  Hive.registerAdapter(WorkoutTypeAdapter());

  var workoutBox = await Hive.openBox("workoutApp");

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedPage = 0;

  void _nagivateBottomBar(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    if (workoutBox.get("WORKOUTDATA") == null) {
      db.createSampleData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  var workoutBox = Hive.box("workoutApp");

  WorkoutDataBase db = WorkoutDataBase();

  @override
  Widget build(BuildContext context) {
    final pages = [
      Workouts(
        workoutsList: db.workoutsList,
        updateData: db.updateData,
      ),
      const Stats()
    ];

    return MaterialApp(
      routes: {
        '/workouts': (context) => Workouts(
              workoutsList: db.workoutsList,
              updateData: db.updateData,
            ),
        '/stats': (context) => Stats(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            primary: Color.fromARGB(255, 58, 57, 57),
            brightness: Brightness.dark,
            onPrimary: Colors.white70,
            secondary: Colors.green,
            onSecondary: Colors.white,
            error: Colors.redAccent,
            onError: Colors.white,
            background: Color.fromARGB(255, 58, 57, 57),
            onBackground: Colors.white,
            surface: Color.fromARGB(255, 27, 27, 27),
            onSurface: Colors.green,
          )),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Workout Tracker",
            ),
          ),
          backgroundColor: Colors.black38,
        ),
        body: pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart), label: "Workouts"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats")
          ],
          backgroundColor: Colors.black38,
          currentIndex: _selectedPage,
          onTap: _nagivateBottomBar,
          selectedFontSize: 14,
          iconSize: 30,
        ),
      ),
    );
  }
}
