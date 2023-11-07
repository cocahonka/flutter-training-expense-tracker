import 'package:expense_tracker_repeat/models/category.dart';
import 'package:expense_tracker_repeat/models/expense.dart';
import 'package:expense_tracker_repeat/widgets/new_expense/amount_input.dart';
import 'package:expense_tracker_repeat/widgets/new_expense/category_select.dart';
import 'package:expense_tracker_repeat/widgets/new_expense/date_select.dart';
import 'package:expense_tracker_repeat/widgets/new_expense/title_input.dart';
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

  void _setCategory(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _setDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

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
              if (constraints.maxWidth <= 600) {
                return Column(
                  children: [
                    TitleInput(_titleController),
                    Row(
                      children: [
                        Expanded(child: AmountInput(_amountController)),
                        Expanded(child: DateSelect(_selectedDate, onDateChanged: _setDate)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          CategorySelect(_selectedCategory, onCategoryChanged: _setCategory),
                          const Spacer(),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Save Expense'),
                          ),
                        ],
                      ),
                    )
                  ],
                );
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
