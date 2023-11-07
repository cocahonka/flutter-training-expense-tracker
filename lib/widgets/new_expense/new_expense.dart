import 'package:expense_tracker_repeat/models/category.dart';
import 'package:expense_tracker_repeat/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    required this.saveNewExpense,
    super.key,
  });

  final ValueSetter<Expense> saveNewExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  var _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePickerModal() {}

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + keyboardSize),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Placeholder();
              } else {
                return Placeholder();
              }
            },
          ),
        ),
      ),
    );
  }
}
