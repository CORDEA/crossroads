import 'package:crossroads/models/stock.dart';
import 'package:crossroads/ui/calculator.dart';
import 'package:crossroads/ui/presets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StockModel(),
      child: MaterialApp(
        title: 'Crossroads',
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
        initialRoute: '/',
        routes: {
          '/': (context) => Calculator(),
          '/presets': (context) => Presets(),
        },
      ),
    );
  }
}
