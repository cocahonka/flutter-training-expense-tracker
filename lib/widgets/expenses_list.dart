import 'package:expense_tracker_repeat/models/expense.dart';
import 'package:expense_tracker_repeat/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
    this.expenses, {
    required this.onExpenseDismissed,
    super.key,
  });

  final List<Expense> expenses;
  final ValueSetter<Expense> onExpenseDismissed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (_) => onExpenseDismissed(expenses[index]),
          child: ExpenseItem(expenses[index]),
        );
      },
    );
  }
}
