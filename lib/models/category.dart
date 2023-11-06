import 'package:flutter/material.dart';

enum Category {
  food(Icons.lunch_dining),
  travel(Icons.flight_takeoff),
  leisure(Icons.movie),
  work(Icons.work);

  const Category(this.icon);

  final IconData icon;
}
