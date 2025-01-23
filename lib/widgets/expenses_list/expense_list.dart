 import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget{
  const ExpenseList ({super.key,
   required this.expenselist ,
   required this.onRemovedExpenses});

  final List <Expense> expenselist ;
  final void Function  (Expense expense) onRemovedExpenses ;


   @override
  Widget build(BuildContext context) {
   return ListView.builder(
    itemCount: expenselist.length,
    itemBuilder: (ctx ,index) =>
    Dismissible(
    key:ValueKey(ExpenseItem(expenselist[index])), 
    onDismissed: (direction){
       onRemovedExpenses(expenselist[index]);

    } ,
    child: 
    ExpenseItem(expenselist[index]))
     
    );
    
  }


}