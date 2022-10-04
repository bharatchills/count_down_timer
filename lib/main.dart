// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var now;
  var how;
  Duration? difference;
  @override
  void initState() {
    super.initState();
    now = DateTime.now().toUtc();
    how = DateTime.parse("20221004 08:59:59").toUtc();
    difference = how.difference(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder<Duration>(
            duration: difference!,
            tween: Tween(begin: difference, end: Duration.zero),
            onEnd: () {
              // print('Timer ended');
            },
            builder: (BuildContext context, Duration value, Widget? child) {
              final minutes = value.inMinutes % 60;
              final hours = value.inHours;

              final seconds = value.inSeconds % 60;
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text('$hours:$minutes:$seconds',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)));
            }),
      ),
    );
  }
}
