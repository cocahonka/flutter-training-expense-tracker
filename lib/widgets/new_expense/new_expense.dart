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

  void _confirmInputData() {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text);

    final isTitleInvalid = title.isEmpty;
    final isAmountInvalid = amount == null;
    final isDateInvalid = _selectedDate == null;

    if (isTitleInvalid || isAmountInvalid || isDateInvalid) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.close, color: Colors.red),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text('Oops...'),
                ),
              ],
            ),
            content: const Text('Check if the title, amout, date and category is selected and input correctly!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );

      return;
    }

    final expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory,
    );

    widget.saveNewExpense(expense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + keyboardSize),
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
                          onPressed: _confirmInputData,
                          child: const Text('Save Expense'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: TitleInput(_titleController)),
                      const SizedBox(width: 16),
                      Expanded(child: AmountInput(_amountController)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        CategorySelect(_selectedCategory, onCategoryChanged: _setCategory),
                        const Spacer(),
                        DateSelect(_selectedDate, onDateChanged: _setDate),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: _confirmInputData,
                          child: const Text('Save Expense'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
