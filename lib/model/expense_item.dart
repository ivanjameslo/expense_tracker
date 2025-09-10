enum Category {food, travel, leisure, work}

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
}