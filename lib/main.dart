import 'package:flutter/material.dart';
import 'package:workout_tracker/pages/stats.dart';
import 'package:workout_tracker/pages/workouts.dart';
import 'package:workout_tracker/objects/workout.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedPage = 0;

  static List<Workout> workoutsList = [
    Workout("Easy Run", 1, "1/24/2024", "Chilling.", WorkoutType.run),
    Workout("Weight Lifting", 0.5, "1/24/2024", "All squats, all the time.",
        WorkoutType.lift),
    Workout("Long Bike", 2, "1/20/2024", "Went for a long bike ride.",
        WorkoutType.bike)
  ];

  final _pages = [Workouts(workoutsList: workoutsList), const Stats()];

  void _nagivateBottomBar(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/workouts': (context) => Workouts(
              workoutsList: workoutsList,
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
        body: _pages[_selectedPage],
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
