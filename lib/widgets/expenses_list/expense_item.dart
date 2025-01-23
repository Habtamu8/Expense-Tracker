import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart' ;


class ExpenseItem extends StatelessWidget{
const ExpenseItem (this.expenseltem ,{super.key});

final Expense expenseltem;
@override
Widget build (context) {

  return Padding(
      padding: const  EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 16
    ),
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Text(expenseltem.title,
       style: Theme.of(context).textTheme.titleLarge,
       ),
        const  SizedBox  (height: 4),
      
          Row(
            children: [
              Text('\$${expenseltem.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children:  [
                Icon(categoryIcons[expenseltem.category]),
                 const SizedBox(width: 8),
                 Text(expenseltem.formattedDate)
                  ],
              )
            ],
          )
                    ],
      ),
    ),
  );
}

}