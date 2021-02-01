import 'package:crossroads/ui/calculator.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink[300],
        accentColor: Colors.amber[300],
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.pink[300],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.pink[300],
          textTheme: ButtonTextTheme.primary,
          minWidth: 64,
          height: 44,
        ),
      ),
      home: Calculator(title: 'Flutter Demo Home Page'),
    );
  }
}
