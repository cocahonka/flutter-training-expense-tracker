import 'package:expense_tracker_repeat/models/category.dart';
import 'package:expense_tracker_repeat/models/expense.dart';
import 'package:expense_tracker_repeat/widgets/chart/chart_item.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart(this.expenses, {super.key});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Theme.of(context).cardTheme.margin!,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),
              Theme.of(context).colorScheme.secondaryContainer,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: Category.values.map((category) {
            return ChartItem(category);
          }).toList(),
        ),
      ),
    );
  }
}
