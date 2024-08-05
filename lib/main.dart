import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/pages/calculator_page.dart';
import 'pages/greeting_page.dart';
import 'pages/home_page.dart'; // Ensure you have this page
import 'pages/calculator_page.dart'; // Ensure you have this page
import 'pages/api_page.dart'; // Ensure you have this page
import 'pages/notes_page.dart'; // Ensure you have this page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => GreetingPage());
          case '/home':
            return MaterialPageRoute(builder: (_) => HomePage());
          case '/tool1':
            return MaterialPageRoute(builder: (_) => CalculatorPage());
          case '/tool2':
            return MaterialPageRoute(builder: (_) => ApiPage());
          case '/tool3':
            return MaterialPageRoute(builder: (_) => NotesPage());
          default:
            return MaterialPageRoute(builder: (_) => GreetingPage());
        }
      },
    );
  }
}
