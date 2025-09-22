import 'package:expense_tracker/model/expense_item.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widgets/expense_item_widget.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {

  void showAddExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense()
    );
  }

  @override
  Widget build(BuildContext context) {

    List<ExpenseItem> expenseItem = [
      ExpenseItem(
        title: 'Lunch',
        amount: 15.99,
        category: Category.food,
        date: DateTime.now(),
      ),
      ExpenseItem(
        title: 'Train Ticket',
        amount: 45.00,
        category: Category.travel,
        date: DateTime.now(),
      ),
      ExpenseItem(
        title: 'Movie Ticket',
        amount: 12.00,
        category: Category.leisure,
        date: DateTime.now(),
      ),
      ExpenseItem(
        title: 'Office Supplies',
        amount: 30.00,
        category: Category.work,
        date: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker', 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.white
          ),
        ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                showAddExpense();
              },
            )
          ],
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            // Chart placeholder
            Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Chart Coming Soon',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            // Expenses List Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Recent Expenses',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Expenses List
            Expanded(
              child: ListView.builder(
                itemCount: expenseItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpenseItemWidget(item: expenseItem[index]);
                },
              ),
            ),
          ],
        ),
    );
  }
}