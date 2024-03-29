import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
        titile: "Kala vuna",
        amount: 160.00,
        date: DateTime.now(),
        category: Category.food
      ),
      Expense(
        titile: "Cinema",
        amount: 230.00,
        date: DateTime.now(),
        category: Category.leisure
      ),
      Expense(
        titile: "Go Home",
        amount: 780.00,
        date: DateTime.now(),
        category: Category.travel
      ),
      Expense(
        titile: "Buy Laptop",
        amount: 73000.00,
        date: DateTime.now(),
        category: Category.work
      )
  ];


  void _openAddExpess(){
    showModalBottomSheet(
      context: context,
     builder: (ctx){
      return NewExpense(onAddExpense: _addExpenses);
    });
  }

  void _addExpenses(Expense expense){
    setState(() {
      _registerExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _registerExpense.indexOf(expense);
    setState(() {
      _registerExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar( 
        duration: const Duration(seconds: 3),
        content: const Text("Deleted"),
        action: SnackBarAction(
          label: 'undo',
          onPressed: (){ 
            setState(() {
              _registerExpense.insert(expenseIndex, expense);
            });
            
          },
          ),
        )
      );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanse tracker"),
        actions: [
        Container(
          margin: const EdgeInsets.only(right: 30),
          child: IconButton(onPressed: _openAddExpess, icon: const Icon(Icons.add),
          ),
        ),
      ]),
        body: Column(children: [
      Expanded(child: 
      ExpensesList(expenses: _registerExpense, onRemove: _removeExpense,)
      )
    ]));
  }
}
