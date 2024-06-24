import 'package:expenses_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpenseApp());
}

var colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(120, 20, 160, 1),
);

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorScheme.onPrimary,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle()
                  .copyWith(color: colorScheme.primary, fontSize: 22),
              titleSmall: const TextStyle().copyWith(
                color: colorScheme.onPrimaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
