import 'package:flutter/material.dart';
import 'home_page.dart';
import 'calculator_page.dart';
import 'api_page.dart';
import 'notes_page.dart';
import 'greeting_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
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
  }
}
