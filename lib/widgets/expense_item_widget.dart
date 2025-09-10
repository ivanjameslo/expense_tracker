import 'package:expense_tracker/model/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseItemWidget extends StatelessWidget {
  final ExpenseItem item;
  const ExpenseItemWidget({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Category Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: _getCategoryColor(),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                item.categoryIcon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // Title and Date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item.date.day}/${item.date.month}/${item.date.year}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Amount
            Text(
              '\$${item.amount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor() {
    switch (item.category) {
      case Category.food:
        return Colors.orange;
      case Category.travel:
        return Colors.blue;
      case Category.leisure:
        return Colors.purple;
      case Category.work:
        return Colors.teal;
    }
  }
}