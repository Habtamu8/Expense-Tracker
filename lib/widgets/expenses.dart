
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';


class Expenses extends StatefulWidget {
  const Expenses ({super.key});
 @override
  State<Expenses> createState() {
   return _Expenses();
  }
}
class _Expenses extends State<Expenses> {

final  List <Expense> _registeredExpenses = [
    Expense(amount: 19.19,
           title: 'Flutter course',
            date: DateTime.now(),
            category: Category.work),
              Expense(amount: 16.89,
           title: 'Cinema',
            date: DateTime.now(),
            category: Category.lesiure)
  ];

void  _openAddExpenseOverlay (){
  showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
   context: context, 
  builder: (ctx)=>NewExpense(onAddExpense: addExpenses) );
}
  
void addExpenses(Expense expense){
  setState(() {
  _registeredExpenses.add(expense);
    
  });

}


void removeExpenses(Expense expense){
  final registeredIndex = _registeredExpenses.indexOf(expense);
  setState(() {
    _registeredExpenses.remove(expense);
  });
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:const Text('Expnese Deleted'),
      duration:const  Duration(seconds: 5),
      action: SnackBarAction(
       label: 'Undo',
       onPressed:(){
       setState(() {
         _registeredExpenses.insert(
          registeredIndex, expense);
       });
       }),
      )
  

  );
}
   @override
  Widget build(BuildContext context) {

  final width=  MediaQuery.of(context).size.width;
  print("width $width");
    
    
    Widget mainContent =const Center(
      child: Text("No Data Available here"),
    );

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpenseList(
                expenselist: _registeredExpenses, 
                onRemovedExpenses:removeExpenses);
    }

    return  
        Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Expense Tracker'),
            actions: [
              IconButton(
              onPressed : _openAddExpenseOverlay, 
              icon: const Icon(Icons.add))
            ],),
           
          body: width < 600
         ? Column(
            children: [
              Chart(expenses: _registeredExpenses),
             Expanded(
              child: mainContent) 
            ],
          ) 
          : Row(children: [ 

            Expanded(
              child: 
              Chart(expenses: _registeredExpenses)),
             Expanded(
              child: mainContent) ],)
             );     
  }
}