import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/cupertino.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(context){
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx,index) => 
      ExpensesItem(expenses[index])
    );
  }
}