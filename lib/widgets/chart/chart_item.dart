import 'package:expense_tracker_repeat/models/category.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  const ChartItem({
    required this.fill,
    required this.category,
    super.key,
  });

  final double fill;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: FractionallySizedBox(
              heightFactor: fill,
              widthFactor: 1,
              alignment: Alignment.bottomCenter,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(
              category.icon,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
