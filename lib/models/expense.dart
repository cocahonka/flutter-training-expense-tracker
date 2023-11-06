import 'package:expense_tracker_repeat/models/category.dart';
import 'package:expense_tracker_repeat/utils/extensions.dart';

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => Constants.kDateFormatter.format(date);
}
