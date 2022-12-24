import 'package:dictionary/screens/seacrched_Words_Screen.dart';
import 'package:dictionary/screens/search_Result_Screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: searchHistoryScreen(),
    );
  }
}
