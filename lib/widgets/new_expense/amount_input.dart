import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  const AmountInput(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(label: Text('Amount')),
    );
  }
}
