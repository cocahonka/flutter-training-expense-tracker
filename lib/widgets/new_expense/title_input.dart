import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  const TitleInput(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      maxLength: 50,
      decoration: const InputDecoration(label: Text('Title')),
    );
  }
}
