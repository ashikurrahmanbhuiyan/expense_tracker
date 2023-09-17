import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid =  Uuid();
final formatter = DateFormat.yMMMd();

enum Category{food,travel,leisure,work} 

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work : Icons.work,
}; 

class Expense {
  Expense({
    required this.titile,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();

  final String titile;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  String get getDate{
    return formatter.format(date);
  }
}
