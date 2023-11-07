import 'package:expense_tracker_repeat/utils/extensions.dart';
import 'package:flutter/material.dart';

class DateSelect extends StatefulWidget {
  const DateSelect(
    this.date, {
    required this.onDateChanged,
    super.key,
  });

  final DateTime? date;
  final ValueSetter<DateTime> onDateChanged;

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  Future<void> _showDatePickerModal() async {
    final initialDate = DateTime.now();
    final firstDate = DateTime(
      initialDate.year - 1,
      initialDate.month,
      initialDate.day,
    );
    final lastDate = initialDate;

    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (date != null) {
      widget.onDateChanged(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(widget.date == null ? 'No date selected' : Constants.kDateFormatter.format(widget.date!)),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: IconButton(
            onPressed: _showDatePickerModal,
            icon: const Icon(Icons.calendar_month),
          ),
        ),
      ],
    );
  }
}
