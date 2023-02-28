import 'package:flutter/material.dart';
import 'package:flutter_app/page/all_expenses.dart';
import 'package:flutter_app/page/categories..dart';
import 'package:flutter_app/page/expenses.dart';
import 'package:provider/provider.dart';

import 'model/database_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => DatabaseProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoriesScreen.name,
      routes: {
        CategoriesScreen.name: (_) => const CategoriesScreen(),
        ExpenseScreen.name: (_) => const ExpenseScreen(),
        AllExpenses.name: (_) => const AllExpenses(),
      },
    );
  }
}
