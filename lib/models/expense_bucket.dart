import 'package:expense_tracker_repeat/models/category.dart';
import 'package:expense_tracker_repeat/models/expense.dart';

class ExpenseBucket {
  ExpenseBucket(this.category, List<Expense> expenses)
      : expenses = expenses.where((expense) => expense.category == category).toList();

  final List<Expense> expenses;
  final Category category;

  double get totalAmount => expenses.fold(0, (amount, expense) => amount + expense.amount);
}
