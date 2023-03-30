import 'package:flutter/material.dart';
import 'package:handyman_app/Screens/Home/home_screen.dart';
import 'package:handyman_app/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handyman Service App',
      home: const HomeScreen(),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: white,
            elevation: 0.0,
          ),
          fontFamily: 'Inter',
          backgroundColor: white),
    );
  }
}
