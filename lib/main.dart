import 'package:flutter/material.dart';
import 'widgets/expenses.dart';

var kColorScame = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 60, 181)
  );
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScame,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScame.onSecondaryContainer,
          foregroundColor: kColorScame.primaryContainer
        ),
        cardTheme: CardTheme(color: kColorScame.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScame.secondaryContainer,
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
           titleLarge:  TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: kColorScame.onPrimaryContainer,
           ),
        )
        ),
      title: 'Flutter Demo',
      home: const Expenses(),
    );
  }
}
