import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_timer_view/features/alarm/screens/alarm_screen.dart';
import 'package:flutter_timer_view/features/clock/screens/clock_screen.dart';
import 'package:flutter_timer_view/features/stop_watch/screens/stop_watch_screen.dart';
import 'package:flutter_timer_view/features/timer/screens/timer_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Timer View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Timer View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  // Timer timer = Timer();
  final stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Center(child: Text("$stopwatch")),
          IconButton(
            onPressed: () {
              setState(() {
                stopwatch.start();
              });
            },
            icon: const Icon(Icons.timer),
          ),
        ],
      ),
      body: IndexedStack(index: index, children: const [
        ClockScreen(),
        AlarmScreen(),
        StopWatchScreen(),
        TimerScreen(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        selectedLabelStyle: const TextStyle(color: Colors.amber),
        selectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.globe, size: 20),
            label: "Clock",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: "Alarm",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Stopwatch",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.av_timer),
            label: "Timer",
          ),
        ],
      ),
    );
  }
}
