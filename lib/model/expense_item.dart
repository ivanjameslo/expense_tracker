import 'package:flutter/material.dart';

enum Category {food, travel, leisure, work}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class ExpenseItem {
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  ExpenseItem({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  IconData get categoryIcon {
    return categoryIcons[category] ?? Icons.help;
  }
}