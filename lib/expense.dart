import 'package:expense_tracker/model/expense_item.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker', 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Add your onPressed code here!
              },
            )
          ],
          backgroundColor: Colors.teal,
        ),
      body: const Column(
        children: [
          Text('Chart'),
          Text('List of Expenses'),
        ],
      ),
    )
    );
  }
}