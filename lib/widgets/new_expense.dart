import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void DatePicker() async{
    final now = DateTime.now();
    final fDate = DateTime(now.year - 1, now.month, now.day);
    final pickDate = await showDatePicker(
          context: context,
         initialDate: now,
          firstDate: fDate,
           lastDate: now);
    setState(() {
      _selectedDate = pickDate;
    });
  }


  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                maxLength: 50,
                decoration: const InputDecoration(
                  prefixText: '\$ ',
                  label: Text('Amount'),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text(_selectedDate == null ? 'no date selected':formatter.format(_selectedDate!)),
                IconButton(onPressed: DatePicker, icon: const Icon(Icons.calendar_month))
              ],),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          DropdownButton(
            value: _selectedCategory,
            items: Category.values.map((e) => DropdownMenuItem(
              value: e,
              child: Text(e.name.toUpperCase()))).toList(), 
              onChanged: (value){
                setState(() {
                  _selectedCategory = value as Category;
                });
              }),
          Row(
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("Cancel")
              ),
            
          ElevatedButton(
            onPressed: (){
              print(_titleController.text);
            }, 
            child: const Text("save Expense")),
            ],
            ),
        ],)
      ]),
      );
  }
}