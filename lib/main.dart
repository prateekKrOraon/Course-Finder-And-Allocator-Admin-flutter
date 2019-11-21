import 'package:course_finder_admin/screens/home.dart';
import 'package:course_finder_admin/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Finder Admin',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Colors.orange[800],
          accentColor: Colors.orange[600]
      ),
      home: Home(),
    );
  }
}