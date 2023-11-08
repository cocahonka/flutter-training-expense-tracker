import 'dart:math';

import 'package:expense_tracker_repeat/models/category.dart';
import 'package:expense_tracker_repeat/models/expense.dart';
import 'package:expense_tracker_repeat/models/expense_bucket.dart';
import 'package:expense_tracker_repeat/widgets/chart/chart_item.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  Chart(this.expenses, {super.key});

  final List<Expense> expenses;
  late final buckets = Category.values
      .map(
        (category) => ExpenseBucket(
          category: category,
          expenses: expenses,
        ),
      )
      .toList();
  late final double maxAmount = buckets.fold(0, (maxAmount, bucket) => max(maxAmount, bucket.totalAmount));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Theme.of(context).cardTheme.margin!,
      child: Container(
        height: 180,
        width: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: buckets.map((bucket) {
              return Expanded(
                child: ChartItem(
                  fill: maxAmount == 0 ? 0 : bucket.totalAmount / maxAmount,
                  category: bucket.category,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
