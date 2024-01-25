import 'package:flutter/material.dart';
import 'package:workout_tracker/pages/add_workout.dart';
import 'package:workout_tracker/pages/stats.dart';
import 'package:workout_tracker/pages/workouts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List _pages = [Workouts(), Stats()];

  int _selectedPage = 0;

  void _nagivateBottomBar(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/workouts': (context) => Workouts(),
        '/stats': (context) => Stats(),
        '/add': (context) => AddWorkout()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            primary: Color.fromARGB(255, 58, 57, 57),
            brightness: Brightness.dark,
            onPrimary: Colors.white54,
            secondary: Colors.green,
            onSecondary: Colors.white,
            error: Colors.redAccent,
            onError: Colors.white,
            background: Color.fromARGB(255, 58, 57, 57),
            onBackground: Colors.white,
            surface: Color.fromARGB(255, 58, 57, 57),
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
