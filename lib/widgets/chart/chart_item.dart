import 'package:expense_tracker_repeat/models/expense_bucket.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  const ChartItem({
    required this.maxAmount,
    required this.bucket,
    super.key,
  });

  final double maxAmount;
  final ExpenseBucket bucket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40, width: 20, child: const ColoredBox(color: Colors.red));
  }
}
