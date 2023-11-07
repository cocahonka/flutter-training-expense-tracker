import 'package:expense_tracker_repeat/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Text('\$${expense.amount}'),
                  const Spacer(),
                  Icon(expense.category.icon),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(expense.formattedDate),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
