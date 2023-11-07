import 'package:expense_tracker_repeat/models/category.dart';
import 'package:expense_tracker_repeat/utils/extensions.dart';
import 'package:flutter/material.dart';

class CategorySelect extends StatelessWidget {
  const CategorySelect(
    this.category, {
    required this.onCategoryChanged,
    super.key,
  });

  final Category category;
  final ValueSetter<Category> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: category,
      items: Category.values.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category.name.capitalise()),
        );
      }).toList(),
      onChanged: (category) {
        if (category != null) {
          onCategoryChanged(category);
        }
      },
    );
  }
}
