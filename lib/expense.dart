import 'package:expense_tracker/model/expense_item.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widgets/expense_item_widget.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<ExpenseItem> _registeredExpenses = [
    ExpenseItem(
      title: 'Lunch',  
      amount: 15.99,
      category: Category.food,
      date: DateTime.now().subtract(const Duration(days: 1)), // Yesterday
    ),
    ExpenseItem(
      title: 'Train Ticket',
      amount: 45.00,
      category: Category.travel,
      date: DateTime.now().subtract(const Duration(days: 3)), // 3 days ago
    ),
    ExpenseItem(
      title: 'Movie Ticket',
      amount: 12.00,
      category: Category.leisure,
      date: DateTime.now().subtract(const Duration(days: 7)), // 1 week ago
    ),
    ExpenseItem(
      title: 'Office Supplies',
      amount: 30.00,
      category: Category.work,
      date: DateTime.now().subtract(const Duration(days: 14)), // 2 weeks ago (oldest)
    ),
  ];

  void _addExpense(ExpenseItem expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(ExpenseItem expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text('Expense item ${expense.title} is deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void showAddExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense)
    );
  }

  @override
  Widget build(BuildContext context) {
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
            // Expenses Chart
            Chart(expenses: _registeredExpenses),
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
            // Expenses List or Empty State
            Expanded(
              child: _registeredExpenses.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long,
                            size: 80,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No more expenses',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tap + to add your first expense',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _registeredExpenses.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Sort expenses by date (most recent first)
                        final sortedExpenses = [..._registeredExpenses];
                        sortedExpenses.sort((a, b) => b.date.compareTo(a.date));
                        final expense = sortedExpenses[index];
                        
                        return Dismissible(
                          key: ValueKey(expense),
                          background: Container(
                            color: Colors.red.shade100,
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            _removeExpense(expense);
                          },
                          child: ExpenseItemWidget(item: expense),
                        );
                      },
                    ),
            ),
          ],
        ),
    );
  }
}