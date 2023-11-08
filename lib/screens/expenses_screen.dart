import 'package:expense_tracker_repeat/models/category.dart';
import 'package:expense_tracker_repeat/models/expense.dart';
import 'package:expense_tracker_repeat/widgets/chart/chart.dart';
import 'package:expense_tracker_repeat/widgets/list/expenses_list.dart';
import 'package:expense_tracker_repeat/widgets/new_expense/new_expense.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Hamburger',
      amount: 5.89,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Syktyvkar',
      amount: 60.67,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _removeExpense(Expense expense) {
    final removedExpenseIndex = _expenses.indexOf(expense);

    setState(() {
      _expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => _addExpense(expense, removedExpenseIndex),
        ),
      ),
    );
  }

  void _addExpense(Expense expense, [int? index]) {
    setState(() {
      if (index == null || index < 0 || index >= _expenses.length) {
        _expenses.add(expense);
      } else {
        _expenses.insert(index, expense);
      }
    });
  }

  void _showExpenseAdderModal() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints.expand(),
      useSafeArea: true,
      builder: (context) {
        return NewExpense(
          saveNewExpense: _addExpense,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _showExpenseAdderModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: width <= 600
            ? Column(
                children: [
                  Chart(_expenses),
                  Expanded(
                    child: ExpensesList(
                      _expenses,
                      onExpenseDismissed: _removeExpense,
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Chart(_expenses)),
                  Expanded(
                    child: ExpensesList(
                      _expenses,
                      onExpenseDismissed: _removeExpense,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
