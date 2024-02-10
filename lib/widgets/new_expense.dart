import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';


class NewExpense extends StatefulWidget{
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  
  
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

  void datePicker() async{
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

  void _submitData(){
    final enterAmount = double.tryParse(_amountController.text);
    final amountInvalid = enterAmount == null || enterAmount<=0;
    if(_titleController.text.trim().isEmpty || amountInvalid || _selectedDate == null){
      showAdaptiveDialog(context: context,
         builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('please make sure valid title,date and date'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            },
            child: const Text('ok'))
          ],
         ));
      return;
    } 
    widget.onAddExpense(
      Expense(
        titile: _titleController.text,
        amount: enterAmount,
        date: _selectedDate!,
        category: _selectedCategory)
    );
    Navigator.pop(context);
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
                  prefixText: '৳ ',
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
                IconButton(onPressed: datePicker, icon: const Icon(Icons.calendar_month))
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
            onPressed: _submitData,
            child: const Text("save Expense")),
            ],
            ),
        ],)
      ]),
      );
  }
}
