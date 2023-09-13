import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpense = [
      Expense(
        titile: "flutter",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food
      ),
      Expense(
        titile: "Cinema",
        amount: 15.58,
        date: DateTime.now(),
        category: Category.leisure
      )
  ];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanse tracker"),
        actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.add),
        ),
      ]),
        body: Column(children: [
      const Text("data"),
      Expanded(child: 
      ExpensesList(expenses: _registerExpense)
      )
    ]));
  }
}
