import 'package:expense_tracker_repeat/screens/expenses_screen.dart';
import 'package:expense_tracker_repeat/utils/extensions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Constants.kLightTheme,
      darkTheme: Constants.kDarkTheme,
      home: const ExpensesScreen(),
    );
  }
}
