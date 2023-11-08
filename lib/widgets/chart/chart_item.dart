import 'package:expense_tracker_repeat/models/category.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  const ChartItem(this.category, {super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40, width: 20, child: const ColoredBox(color: Colors.red));
  }
}
