import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';



var KcolorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,96,59, 181));

void main()  {
  runApp(   
MaterialApp(
debugShowCheckedModeBanner: false,
theme:ThemeData().copyWith(
  colorScheme: KcolorScheme,
  appBarTheme:const  AppBarTheme().copyWith(
    backgroundColor: KcolorScheme.primaryContainer,
    foregroundColor: KcolorScheme.primary
  ),
  cardTheme: const CardTheme().copyWith(
    color:KcolorScheme.primaryContainer,
    margin:const EdgeInsets.all(16)
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    backgroundColor:KcolorScheme.primaryContainer,

  )),
  textTheme: ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: KcolorScheme.onSecondaryContainer,
    )
  )
  ),

 
 
home:const Expenses()
 )
);
}